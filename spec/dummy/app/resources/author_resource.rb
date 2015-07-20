class AuthorResource < JSONAPI::Resource

  attribute :name
  filters :name

end
