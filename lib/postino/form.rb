module Postino
  class Form
    attr_accessor :account_number, :text_amount, :numeric_amount, :payee_name,
                  :payer_name, :reason

    attr_reader :address

    def initialize
      @address = Address.new
    end

    def generate(path)
      Postino::Generator.generate_form(path, self)
    end
  end
end
