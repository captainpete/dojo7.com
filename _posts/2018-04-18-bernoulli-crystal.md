---
layout: post
title:  "bernoulli.cr"
excerpt: "<p>Bernoulli numbers in crystal-lang.</p>"
---

I've written a computer program for calculating the sequence of [Bernoulli numbers](https://en.wikipedia.org/wiki/Bernoulli_number).
This program is written in [Crystal](https://crystal-lang.org/), and borrows heavily from the [Ruby implementation](http://rosettacode.org/wiki/Bernoulli_numbers#Ruby).

The `Bernoulli` class implements an `Iterator` that calculates $$a(x)$$ using the Akiyama–Tanigawa algorithm, for successively larger values for $$x$$.
An improved version may be available on [Rosetta code](http://rosettacode.org/wiki/Bernoulli_numbers#Crystal).

{% highlight crystal %}
require "big"

class Bernoulli
  include Iterator(Tuple(Int32, BigRational))

  def initialize
    @a = [] of BigRational
    @m = 0
  end

  def next
    @a << BigRational.new(1, @m+1)
    @m.downto(1) { |j| @a[j-1] = j*(@a[j-1] - @a[j]) }
    v = @m.odd? && @m != 1 ? BigRational.new(0, 1) : @a.first
    return {@m, v}
  ensure
    @m += 1
  end
end

b = Bernoulli.new
bn = b.first(61).to_a

max_width = bn.map { |_, v| v.numerator.to_s.size }.max
bn.reject { |i, v| v.zero? }.each do |i, v|
  puts "B(%2i) = %*i/%i" % [i, max_width, v.numerator, v.denominator]
end
{% endhighlight %}

Running this program will produce the following output:

```
B( 0) =                                            1/1
B( 1) =                                            1/2
B( 2) =                                            1/6
B( 4) =                                           -1/30
B( 6) =                                            1/42
B( 8) =                                           -1/30
B(10) =                                            5/66
B(12) =                                         -691/2730
B(14) =                                            7/6
B(16) =                                        -3617/510
B(18) =                                        43867/798
B(20) =                                      -174611/330
B(22) =                                       854513/138
B(24) =                                   -236364091/2730
B(26) =                                      8553103/6
B(28) =                                 -23749461029/870
B(30) =                                8615841276005/14322
B(32) =                               -7709321041217/510
B(34) =                                2577687858367/6
B(36) =                        -26315271553053477373/1919190
B(38) =                             2929993913841559/6
B(40) =                       -261082718496449122051/13530
B(42) =                       1520097643918070802691/1806
B(44) =                     -27833269579301024235023/690
B(46) =                     596451111593912163277961/282
B(48) =                -5609403368997817686249127547/46410
B(50) =                  495057205241079648212477525/66
B(52) =              -801165718135489957347924991853/1590
B(54) =             29149963634884862421418123812691/798
B(56) =          -2479392929313226753685415739663229/870
B(58) =          84483613348880041862046775994036021/354
B(60) = -1215233140483755572040304994079820246041491/56786730
```

