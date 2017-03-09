# JSONAPI::Resources::Matchers

Spec matchers for [jsonapi-resources](https://github.com/cerebris/jsonapi-resources).

Currently, only RSpec matchers exist.

## Installation

Add this line to your application's Gemfile (in a `test` group):

```ruby
gem 'jsonapi-resources-matchers'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jsonapi-resources-matchers

Require the gem in your `spec/spec_helper`:

```ruby
require 'jsonapi/resources/matchers'
```

## Usage

Anything with a `type` of `resource` will have the matchers automatically included.

```ruby
class Book < ActiveResource::Base
end

class Api::V1::BookResource < JSONAPI::Resource
  primary_key :isbn
  attributes :title
  has_many :readers, class_name: "Person"
  filters :author_id
end

RSpec.describe Api::V1::BookResource, type: :resource do
  let(:book) { Book.new }
  subject { described_class.new(book, {}) }

  it { is_expected.to have_primary_key :isbn }
  it { is_expected.to have_attribute :title }
  it { is_expected.to have_many(:readers).with_class_name("Person") }
  it { is_expected.to filter(:author_id) }
end
```

## Development

- in `spec/dummy`, run: `bundle exec rake db:migrate`
- in project dir, run tests: `rspec spec`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/g5/jsonapi-resources-matchers. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org/) code of conduct.

## MIT License

Copyright 2016 G5

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
