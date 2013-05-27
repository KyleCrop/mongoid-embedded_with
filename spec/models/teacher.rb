class Teacher
  # Dependencies
  include Mongoid::Document
  include Mongoid::EmbeddedWith

  # Relations
  embedded_in :school
  embedded_with_many :courses
  embedded_with_many :classrooms, through: :courses
  embedded_with_many :students, through: :courses

  # Properties
  field :name, type: String

end # Teacher