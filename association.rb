Association - Helps us to make connection between two or more tables/models .

Association :

belongs_to : 1:1
has_one 1:1
has_many 1 : m
has_one :through 1:1
has_many :through M:M
has_and_belongs_to_many M:M

polymorphic
STI



class User
  has_one :image
end


class Image
  belongs_to :user
end
image_name
image_size
user_id : integer


u = User.find_by_name "manav"
# select * from images where user_id = u.id
u.image




gem 'paperclip'


rails g model image
rails g paperclip image photo
