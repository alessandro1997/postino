require 'spec_helper'

describe Postino::Generator do
  describe '.generate_form' do
    it 'generates the form' do
      expect {
        Postino::Generator.generate_form(File.expand_path('../form.pdf', __FILE__), {
          account_number: '0123456789',
          numeric_amount: 11111,
          text_amount: 'UNDICI MILIONI CENTOUNDICIMILA/00',
          company_name: 'ACME SRL',
          reason: 'LOREM IPSUM DOLOR SIT AMET, ADIPISCING CONSECTETUR ELIT',
          payer_name: 'MARIO ROSSI',
          address: {
            street: 'VIA FASULLA, 123',
            zip_code: '00100',
            city: 'ROMA',
            state: 'RM'
          }
        })
      }.not_to raise_error
    end
  end
end
