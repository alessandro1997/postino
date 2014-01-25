require 'spec_helper'

describe Postino::Form do
  subject { Postino::Form.new }

  describe '#configure' do
    it 'takes a block for configuration' do
      subject.configure do |f|
        f.account_number = 'test'
      end.account_number.should == 'test'
    end
  end

  describe '#generate' do
    it 'generates the PDF form' do
      Postino::Generator.expects(:generate_form).once
      subject.generate('test.pdf')
    end
  end
end
