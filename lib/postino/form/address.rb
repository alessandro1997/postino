require 'docile'

module Postino
  class Form
    class Address
      attr_accessor :street, :zip_code, :city, :state

      def initialize(&block)
        configure(&block) if block_given?
      end

      def configure(&block)
        Docile.dsl_eval(self, self, &block)
        self
      end

      def location
        "#{city} (#{state})"
      end
    end
  end
end
