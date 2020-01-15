class User < ApplicationRecord
  has_many :reading_plans
  has_many :books, through: :reading_plans
end
