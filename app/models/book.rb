class Book < ApplicationRecord
  belongs_to :search
  has_many :reading_plans
  has_many :users, through: :reading_plans
end
