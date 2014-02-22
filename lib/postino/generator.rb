require 'prawn'
require 'prawn/templates'

module Postino
  class Generator
    class << self
      TEMPLATE_PATH = File.expand_path('../../../assets/form.pdf', __FILE__)

      ACCOUNT_NUMBER_COORDINATES = [[96, 258], [473, 258]]
      TEXT_AMOUNT_COORDINATES = [[515, 243], [87, 243]]
      REASON_COORDINATES = [[32, 180], [400, 180]]
      PAYER_NAME_COORDINATES = [[32, 138], [541, 143]]
      COMPANY_NAME_COORDINATES = [[32, 220], [397, 220]]
      ADDRESS_STREET_COORDINATES = [[60, 107], [540, 105]]
      ADDRESS_ZIP_CODE_COORDINATES = [[60, 92], [540, 80]]
      ADDRESS_LOCATION_COORDINATES = [[60, 77], [615, 80]]

      # Generates a new postal payment form.
      #
      # @param path [String]        The target path
      # @param form [Postino::Form] The form model
      def generate_form(path, form)
        Prawn::Document.generate(path, template: TEMPLATE_PATH, margin: 0) do |pdf|
          pdf.font 'Courier'
          pdf.font_size 11

          add_account_number(pdf, form)
          add_text_amount(pdf, form)
          add_numeric_amount(pdf, form)
          add_payee_name(pdf, form)
          add_reason(pdf, form)
          add_payer_name(pdf, form)
          add_address(pdf, form)
        end
      end

      protected

        def add_account_number(pdf, form)
          ACCOUNT_NUMBER_COORDINATES.each do |coordinates|
            pdf.text_box form.account_number, at: coordinates, character_spacing: 6
          end
        end

        def add_text_amount(pdf, form)
          TEXT_AMOUNT_COORDINATES.each do |coordinates|
            pdf.text_box form.text_amount, at: coordinates
          end
        end

        def add_numeric_amount(pdf, form)
          numeric_amount = ('%.2f' % form.numeric_amount).gsub('.', '')
          numeric_amount_y = 363 - 13 * numeric_amount.length

          [[numeric_amount_y, 257], [numeric_amount_y + 473, 257]].each do |coordinates|
            pdf.text_box numeric_amount, at: coordinates, character_spacing: 6
          end
        end

        def add_payee_name(pdf, form)
          pdf.text_box form.payee_name, at: COMPANY_NAME_COORDINATES[0], width: 300
          pdf.text_box form.payee_name, at: COMPANY_NAME_COORDINATES[1], character_spacing: 6
        end

        def add_reason(pdf, form)
          pdf.bounding_box(REASON_COORDINATES[0], width: 300, height: 100) do
            pdf.text_box form.reason
          end

          pdf.bounding_box(REASON_COORDINATES[1], width: 400, height: 100) do
            pdf.text_box form.reason
          end
        end

        def add_payer_name(pdf, form)
          pdf.bounding_box(PAYER_NAME_COORDINATES[0], width: 180, height: 100) do
            pdf.text_box form.payer_name
          end

          pdf.bounding_box(PAYER_NAME_COORDINATES[1], width: 300, height: 100) do
            pdf.text_box form.payer_name, character_spacing: 5.7, height: 100, overflow: :truncate
          end
        end

        def add_address(pdf, form)
          pdf.text_box(form.address.street,
            at:       ADDRESS_STREET_COORDINATES[0],
            width:    130,
            height:   10,
            size:     9,
            overflow: :truncate
          )

          pdf.text_box(form.address.street,
            at:                ADDRESS_STREET_COORDINATES[1],
            width:             300,
            height:            10,
            character_spacing: 6,
            overflow:          :truncate
          )

          pdf.text_box form.address.zip_code, at: ADDRESS_ZIP_CODE_COORDINATES[0], size: 9
          pdf.text_box form.address.zip_code, at: ADDRESS_ZIP_CODE_COORDINATES[1], character_spacing: 6

          pdf.text_box(form.address.location,
            at:       ADDRESS_LOCATION_COORDINATES[0],
            width:    200,
            height:   10,
            size:     9,
            overflow: :truncate
          )

          pdf.text_box(form.address.location,
            at:                ADDRESS_LOCATION_COORDINATES[1],
            width:             200,
            height:            10,
            character_spacing: 6,
            overflow:          :truncate
          )
        end
    end
  end
end
