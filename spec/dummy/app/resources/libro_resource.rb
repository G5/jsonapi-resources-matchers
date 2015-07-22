class LibroResource < JSONAPI::Resource

  model_name "Book"
  has_one :author, class_name: "Writer", relation_name: :writer

end
