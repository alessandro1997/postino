# Postino [![Gem Version](https://badge.fury.io/rb/postino.png)](http://badge.fury.io/rb/postino) [![Build Status](https://travis-ci.org/alessandro1997/postino.png?branch=master)](https://travis-ci.org/alessandro1997/postino) [![Dependency Status](https://gemnasium.com/alessandro1997/postino.png)](https://gemnasium.com/alessandro1997/postino) [![Code Climate](https://codeclimate.com/github/alessandro1997/postino.png)](https://codeclimate.com/github/alessandro1997/postino)

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
Postino::Form.new do |f|
  f.account_number = '0123456789'
  f.numeric_amount = 11111
  f.text_amount = 'UNDICIMILACENTOUNDICI/00'
  f.company_name = 'ACME SRL'
  f.reason = 'LOREM IPSUM DOLOR SIT AMET, ADIPISCING CONSECTETUR ELIT'
  f.payer_name = 'MARIO ROSSI'

  f.address.configure do |a|
    a.street = 'VIA FASULLA, 123'
    a.zip_code = '00100'
    a.city = 'ROMA'
    a.state = 'RM'
  end
end.generate('my_form.pdf')
```

## Contributing

1. [Fork it](http://github.com/alessandro1997/postino/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
