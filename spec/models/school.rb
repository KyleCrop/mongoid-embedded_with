class School
  # Dependencies
  include Mongoid::Document
  include Mongoid::EmbeddedWith

  # Relations
  embeds_many :classrooms
  embeds_many :courses
  embeds_many :students
  embeds_many :teachers

  # Properties
  field :name, type: String

end # School