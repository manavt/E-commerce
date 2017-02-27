DataTypes


integer
boolean
string
text
blob




first
last
all
find
find_by
where
pluck
count

Product.first
Product.last
Product.all
Product.find :id
Product.find_by_name :name
Product.where(name: 'a', id: 5)
Product.where("name is null")
Product.where("name is 'Jeans'")






ActiveRecord : is a package who helps model to talk with database with ORM



Model

Product.last

ORM (select * from product order DESC)

DB




Migration Methods

To add a column to a table
rails g migration add_column_to_product content:boolean

To remove a column from a table
rails g migration remove_column_from_product content

to drop a table

drop_table :product
create_table :new_table_name do | obj |
  obj.string :name
end






rails g model ashok name
rake db:migrate
or

class Abc < ActiveRecord::Migration
  def up
    create_table :ashok do | obj |
      obj.string :name
    end
  end
end
