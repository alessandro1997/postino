require 'spec_helper'

describe Postino::Form::Address do
  subject { Postino::Form::Address.new }

  describe '#configure' do
    it 'takes a block for configuration' do
      subject.configure do |a|
        a.zip_code = '00100'
      end.zip_code.should == '00100'
    end
  end

  describe '#location' do
    before do
      subject.city = 'Roma'
      subject.state = 'RM'
    end

    it 'returns the city and state' do
      subject.location.should == 'Roma (RM)'
    end
  end
end
