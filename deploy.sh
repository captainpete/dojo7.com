#!/bin/bash
aws s3 sync _site s3://dojo7.com/
aws cloudfront create-invalidation --distribution-id E2S75TUIVLCC88 --paths "/*"

