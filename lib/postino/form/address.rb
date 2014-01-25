module Postino
  class Form
    class Address
      attr_accessor :street, :zip_code, :city, :state

      def location
        "#{city} (#{state})"
      end
    end
  end
end
