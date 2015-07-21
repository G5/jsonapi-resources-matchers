class LibroResource < JSONAPI::Resource

  model_name "Book"
  has_one :author

end
