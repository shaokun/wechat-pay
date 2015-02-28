require 'pry'
require 'wechatpay'
require 'webmock/rspec'

Wechatpay.configure do |w|
  w.payment_key = 'test_key'
end
