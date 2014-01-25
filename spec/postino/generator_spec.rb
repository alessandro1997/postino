require 'spec_helper'

describe Postino::Generator do
  describe '.generate_form' do
    let(:form) do
      Postino::Form.new.tap do |f|
        f.account_number = '1234567890'
        f.numeric_amount = 11111
        f.text_amount    = 'UNDICIMILACENTOUNDICI/00'
        f.payee_name     = 'LOREM IPSUM DOLOR SIT AMET, ADIPISCING CONSECTETUR ELIT CORP.'
        f.reason         = 'LOREM IPSUM DOLOR SIT AMET, ADIPISCING CONSECTETUR ELIT.'
        f.payer_name     = 'MARIO ROSSI DI MONTEBIANCO'

        f.address.tap do |a|
          a.street   = 'VIA FASULLA, 123'
          a.zip_code = '00100'
          a.city     = 'ROMA'
          a.state    = 'RM'
        end
      end
    end

    it 'generates the form' do
      expect {
        Postino::Generator.generate_form(
          File.expand_path('../form.pdf', __FILE__),
          form
        )
      }.not_to raise_error
    end
  end
end
