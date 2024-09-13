#!/bin/bash
jq --tab '
  .name = "anytype-dev" |
  .version = "0.43.100-alpha" |
  .description = "Anytype Nightly" |
  .build.appId = "com.anytype.anytype-dev" |
  .build.productName = "Anytype Nightly" |
  .build.protocols[0].name = "Anytype Nightly" |
  .build.mac.publish |= map(del(.url)) |
  .build.mac.publish[0].provider = "s3" |
  .build.mac.publish[0].bucket = "%NIGHTLY_AWS_S3_BUCKET%" |
  .build.mac.publish[0].region = "%NIGHTLY_AWS_REGION%" |
  .build.win.publish |= map(del(.url)) |
  .build.win.publish[0].provider = "s3" |
  .build.win.publish[0].bucket = "%NIGHTLY_AWS_S3_BUCKET%" |
  .build.win.publish[0].region = "%NIGHTLY_AWS_REGION%" |
  .build.linux.description = "Anytype Nightly" |
  .build.linux.desktop.Name = "Anytype Nightly" |
  .build.linux.publish |= map(del(.url)) |
  .build.linux.publish[0].provider = "s3" |
  .build.linux.publish[0].bucket = "%NIGHTLY_AWS_S3_BUCKET%" |
  .build.linux.publish[0].region = "%NIGHTLY_AWS_REGION%"
' package.json > package-nightly-new.json
