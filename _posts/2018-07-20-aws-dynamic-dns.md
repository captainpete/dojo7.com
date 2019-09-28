---
layout: post
title:  "Dynamic DNS with AWS Route53"
---

The following details my dynamic DNS setup.

## Problem description

My ISP provides me with a dynamic IP address.
On occasion the connection drops and I receive a new IP address.
To connect back to my home servers, I need a hostname that updates when my home IP changes.

## Solution

Dependencies:

- [AWS Route53](https://aws.amazon.com/route53/)
- Linux server with the following software
  - [bash](https://www.gnu.org/software/bash/)
  - [dig](ftp://ftp.isc.org/isc/bind9/cur/9.10/doc/arm/man.dig.html)
  - [AWS CLI](https://aws.amazon.com/cli/)
  - [cron](https://en.wikipedia.org/wiki/Cron)

My domains are hosted with AWS Route53.
AWS allows programmatically updating Route53 hosted zones via the command line using the AWS CLI utility.
Additionally, AWS provides a convenient endpoint for finding the current IP address.

After installing the AWS CLI tool on a small Linux server within my home network, I've set up the following script to be run regularly via cron.

{% highlight bash %}
#!/bin/bash

zone_name="dojo7.com"
host_name="home"
zone_id="ZXXXXXXXXXXX"
# zone ID can be found through Route53 admin panel

# get current timestamp
ts=`date "+%Y%m%d%H%M%S"`

# find the first name server of the domain
ns=`dig +short -t NS $zone_name | head -n 1`

# check the name server to see what the IP on record
ns_ip=`dig @$ns +short -t A $host_name.$zone_name`

# ask AWS which IP you have in reality
new_ip=`curl -4sS "http://checkip.amazonaws.com"`

# exit if no change is required
if [ "$new_ip" == "$ns_ip" ]; then
  exit
fi

# we have a new IP address, let's update the zone
echo "$host_name.$zone_name change from '$ns_ip' to '$new_ip'"

# create a payload to update AWS Route53
payload="/tmp/update_dns_$ts.json"
cat << EOF > $payload
{
  "Comment": "Self-update from $host_name.$zone_name $ts",
  "Changes": [
    {
      "Action": "UPSERT",
      "ResourceRecordSet": {
        "Name": "$host_name.$zone_name.",
        "Type": "A",
        "TTL": 300,
        "ResourceRecords": [
          {
            "Value": "$new_ip"
          }
        ]
      }
    }
  ]
}
EOF

# update Route53
aws route53 change-resource-record-sets \
  --hosted-zone-id $zone_id \
  --change-batch file://$payload \
  && rm $payload
{% endhighlight %}

