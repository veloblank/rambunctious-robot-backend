class User < ApplicationRecord
  has_one :reading_plan, dependent: :destroy
end
