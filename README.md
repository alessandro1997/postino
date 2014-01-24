# Postino [![Build Status](https://travis-ci.org/alessandro1997/postino.png?branch=master)](https://travis-ci.org/alessandro1997/postino)

[Postino](https://github.com/alessandro1997/postino) is a Ruby gem that allows to quickly generate Italian postal
payment forms in PDF format using [Prawn](https://github.com/prawnpdf/prawn).

## Installation

Add this line to your application's Gemfile:

    gem 'postino'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install postino

## Usage

```ruby
Postino::Generator.generate_form('form.pdf', {
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
```

## Contributing

1. [Fork it](http://github.com/alessandro1997/postino/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
