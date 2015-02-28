require 'spec_helper'

describe Wechatpay::Service do
  it 'haha' do
    stub_request(:get, 'www.google.com').to_return(body: 'Success')
    expect(Net::HTTP.get('www.google.com', '/')).to eq('Success')
  end
end
