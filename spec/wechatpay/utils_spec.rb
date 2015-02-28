require 'spec_helper'

describe Wechatpay::Utils do
  let (:hash) { { a: 1, b: 'TEST' } }
  let (:xml_hash) { "<xml>\n<a>1</a>\n<b>TEST</b>\n</xml>" }

  describe '.cdata_cell' do
    it 'doesnt convert number' do
      result = Wechatpay::Utils.cdata_cell(1)
      expect(result).to eq(1)
    end

    it 'wrap others' do
      result = Wechatpay::Utils.cdata_cell('TEST')
      expect(result).to eq('<![CDATA[TEST]]>')
    end
  end

  describe '.cdata' do
    it 'cdata a hash' do
      result = Wechatpay::Utils.cdata(hash)
      expect(result).to eq(a: 1, b: '<![CDATA[TEST]]>')
    end

    it 'raise error when not a hash' do
      expect { Wechatpay::Utils.cdata('123') }.to raise_error(ArgumentError)
    end
  end

  describe '.with_hash' do
    it 'works when pass hash' do
      expect(Wechatpay::Utils.with_hash(hash) { |h| h[:a] }).to eq(1)
    end

    it 'raise error when pass non-hash' do
      expect { Wechatpay::Utils.with_hash(1) { |h| h[:a] } }.to raise_error(ArgumentError)
    end
  end

  describe '.to_xml' do
    it 'change hash into xml string' do
      expect(Wechatpay::Utils.to_xml(hash)).to eq(xml_hash)
    end
  end
end
