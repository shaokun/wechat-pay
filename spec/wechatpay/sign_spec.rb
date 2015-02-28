require 'spec_helper'

describe Wechatpay::Sign do
  let (:params) do
    { a: 1, b: 2 }
  end
  let (:inversed_params) do
    { b: 2, a: 1 }
  end
  let (:params_string) { "a=1&b=2&key=#{Wechatpay::Config.payment_key}" }

  describe '.md5' do
    it 'returns the same with different params order' do
      sign1 = Wechatpay::Sign.md5(params)
      sign2 = Wechatpay::Sign.md5(inversed_params)
      expect(sign1).to eq(sign2)
    end

    it 'signs the params with md5' do
      sign = Wechatpay::Sign.md5(params)
      expect(sign).to eq(Digest::MD5.hexdigest(params_string).upcase)
    end
  end

  describe '.valid?' do
    it 'validate the params with sign' do
      signed_string = Wechatpay::Sign.md5(params)
      p = params.merge('sign' => signed_string)
      expect(Wechatpay::Sign.valid?(p)).to be_truthy
    end
  end
end
