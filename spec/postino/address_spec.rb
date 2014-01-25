require 'spec_helper'

describe Postino::Form::Address do
  subject { Postino::Form::Address.new }

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
