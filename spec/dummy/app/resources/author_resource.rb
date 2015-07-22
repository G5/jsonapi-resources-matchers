class AuthorResource < JSONAPI::Resource

  primary_key :name
  attribute :name
  filters :name

  has_many :books
  has_many :libros, class_name: "Book", relation_name: :books

end
