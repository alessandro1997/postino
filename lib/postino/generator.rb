require 'prawn'

module Postino
  class Generator
    class << self
      TEMPLATE_PATH = File.expand_path('../../../assets/form.pdf', __FILE__)

      ACCOUNT_NUMBER_COORDINATES = [[96, 258], [473, 258]]
      TEXT_AMOUNT_COORDINATES = [[515, 243], [87, 243]]
      REASON_COORDINATES = [[32, 180], [400, 180]]
      PAYER_NAME_COORDINATES = [[32, 138], [541, 143]]

      def generate_form(path, options = {})
        options = normalize_options(options)
        options[:address] = normalize_options(options[:address])

        Prawn::Document.generate(path, template: TEMPLATE_PATH, skip_page_creation: true, margin: 0) do
          font 'Courier'
          font_size 11

          ACCOUNT_NUMBER_COORDINATES.each do |coordinates|
            text_box options[:account_number], at: coordinates, character_spacing: 6
          end

          TEXT_AMOUNT_COORDINATES.each do |coordinates|
            text_box options[:text_amount], at: coordinates
          end

          numeric_amount = ('%.2f' % options[:numeric_amount]).gsub('.', '')
          numeric_amount_y = 363 - 13 * numeric_amount.length

          [
            [numeric_amount_y, 257],
            [numeric_amount_y + 473, 257]
          ].each do |coordinates|
            text_box numeric_amount, at: coordinates, character_spacing: 6
          end

          text_box options[:company_name], at: [32, 220]
          text_box options[:company_name], at: [397, 220], character_spacing: 6

          bounding_box(REASON_COORDINATES[0], width: 300, height: 100) do
            text_box options[:reason]
          end

          bounding_box(REASON_COORDINATES[1], width: 400, height: 100) do
            text_box options[:reason]
          end

          bounding_box(PAYER_NAME_COORDINATES[0], width: 180, height: 100) do
            text_box options[:payer_name]
          end

          bounding_box(PAYER_NAME_COORDINATES[1], width: 300, height: 100) do
            text_box options[:payer_name], character_spacing: 6
          end

          text_box options[:address][:street], at: [60, 107], width: 130, height: 10, size: 9, overflow: :truncate
          text_box options[:address][:street], at: [540, 105], width: 300, height: 10, character_spacing: 6, overflow: :truncate

          text_box options[:address][:zip_code], at: [60, 92], size: 9
          text_box options[:address][:zip_code], at: [540, 80], character_spacing: 6

          location = "#{options[:address][:city]} (#{options[:address][:state]})"

          text_box location, at: [60, 77], width: 200, height: 10, size: 9, overflow: :truncate
          text_box location, at: [615, 80], width: 200, height: 10, character_spacing: 6, overflow: :truncate
        end
      end

      private

        def normalize_options(options)
          options.each do |key, value|
            value.upcase! if value.is_a?(String)
          end

          options
        end
    end
  end
end
