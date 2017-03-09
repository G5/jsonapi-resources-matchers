class AuthorResource < JSONAPI::Resource

  primary_key :name
  attributes :name, :address, :birth_name
  filters :name

  has_many :books
  has_many :libros, class_name: "Book", relation_name: :books

  def self.updatable_fields(context)
    super - [:birth_name]
  end

end
