class AuthorResource < JSONAPI::Resource

  attribute :name
  filters :name

  has_many :books
  has_many :libros, class_name: "Book"

end
