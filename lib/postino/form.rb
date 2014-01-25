require 'docile'

module Postino
  class Form
    attr_accessor :account_number, :text_amount, :numeric_amount, :payee_name,
                  :payer_name, :reason

    attr_reader :address

    def initialize(&block)
      @address = Address.new
      configure(&block) if block_given?
    end

    def configure(&block)
      Docile.dsl_eval(self, self, &block)
      self
    end

    def generate(path)
      Postino::Generator.generate_form(path, self)
    end
  end
end
