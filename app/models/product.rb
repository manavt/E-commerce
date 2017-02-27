class Product < ApplicationRecord
  include ActiveModel::Validations
  has_many :images, as: :entity
  class TitleValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      record.errors.add attribute, "must start with 'the'" unless value =~ /\Athe/i
    end
  end
  validates :name , presence: true , title: true
  validates :brand , presence: true, exclusion: {in: %w(pakistan admin)}
  validates :product_type , presence: true, format: { with: /\A\D.*\Z/ }
  validates :price , presence: true, numericality: true
  after_destroy :take_backup
  def take_backup
    File.open("#{Rails.root}/public/JSON/common.json", "a+") { | foo |
      foo.write(self.to_json)
    }
  end
  before_save do | m |
     self.name = name.upcase
  end
  before_validation :change_the_value
  def change_the_value
    if name.blank?
       self.name = "the manav"
    end
  end

end
