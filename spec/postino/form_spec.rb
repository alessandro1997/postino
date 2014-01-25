require 'spec_helper'

describe Postino::Form do
  subject { Postino::Form.new }

  describe '#generate' do
    it 'generates the PDF form' do
      Postino::Generator.expects(:generate_form).once
      subject.generate('test.pdf')
    end
  end
end
