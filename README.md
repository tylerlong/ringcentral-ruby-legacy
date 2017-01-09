# ringcentral-ruby

A sample RingCentral SDK in Ruby.


## Purpose

This repository is to demonstrate how to add a new language to the [rc-codegen](https://github.com/tylerlong/rc-codegen) project.


## Generated code and manually written code

`src/paths.rb` is auto-generated, others are manually written.


## How to test

Create `.env` file with the following content:

```
production=false
server=https://platform.devtest.ringcentral.com
appKey=appKey
appSecret=appSecret
username=username
extension=extension
password=password
receiver=number-to-receiver-sms
```

Run `ruby test/requests.rb`
