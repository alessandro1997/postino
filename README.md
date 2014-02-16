# Postino [![Gem Version](https://badge.fury.io/rb/postino.png)](http://badge.fury.io/rb/postino) [![Build Status](https://travis-ci.org/interconn-wisp/postino.png?branch=master)](https://travis-ci.org/interconn-wisp/postino) [![Dependency Status](https://gemnasium.com/interconn-wisp/postino.png)](https://gemnasium.com/interconn-wisp/postino) [![Code Climate](https://codeclimate.com/github/interconn-wisp/postino.png)](https://codeclimate.com/github/interconn-wisp/postino)

[Postino](https://github.com/interconn-wisp/postino) is a Ruby gem that allows to quickly generate Italian postal
payment forms in PDF format using [Prawn](https://github.com/prawnpdf/prawn).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'postino'
```

And then execute:

```console
$ bundle
```

Or install it yourself as:

```console
$ gem install postino
```

## Usage

```ruby
Postino::Form.new.tap do |f|
  f.account_number = '0123456789'
  f.numeric_amount = 11111
  f.text_amount = 'UNDICIMILACENTOUNDICI/00'
  f.payee_name = 'ACME SRL'
  f.reason = 'LOREM IPSUM DOLOR SIT AMET, ADIPISCING CONSECTETUR ELIT'
  f.payer_name = 'MARIO ROSSI'

  f.address.tap do |a|
    a.street = 'VIA FASULLA, 123'
    a.zip_code = '00100'
    a.city = 'ROMA'
    a.state = 'RM'
  end
end.generate('my_form.pdf')
```

## Contributing

1. [Fork it](http://github.com/interconn-wisp/postino/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
