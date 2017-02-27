class User < ApplicationRecord
  has_one :image , as: :entity
  accepts_nested_attributes_for :image
end
