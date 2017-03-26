eval : try t execute everything whatever you give to eval
 eval("1")
  => 1
  eval("def hexa; puts 'Hello';end; hexa")
  Hello
=> nil
eval("str")
#NameError: undefined local variable or method `str' for main:Object
instance_eval # gives class method at run time .
class A
end
A.instance_eval do
  def nano
     puts "I am class method"
  end
end
A.nano

class_eval # gives instance method at run time .
class A
end
A.instance_eval do
  def hexa
     puts "I am class method"
  end
end
A.new.hexa


send # dynamically way to call a method
class Xyz
  def p1(*args)
    puts "Hello"
  end
  def p2(a, b)
    puts c = a + b
  end
end

x = Xyz.new
# x.p1
# x.p2(10, 20)
# else
instance_method(false) # gives all the user defined instance_methods list
Xyz.instance_methods(false).each do | m |
  x.send(m, 10, 20)
end

undef_method # undef_method form base as well as super class
class A
  def h1
  end
  def h2
  end
  undef_method :h1
end
a = A.new
a.h1

remove_method # remove_method remove method only for  base class

instance_variable_set
instance_variable_get

class Bbc
  def initialize(a, b)
    @name = a
    @address = b
  end
  def call_user
    puts @name
    puts @address
    puts @location
  end
end
class_variable_set
class_variable_get

class Bbc
  def call_user
    puts @@name
   end
end

const_set
const_get
class Bbc
  def call_user
    puts NAME
   end
end
attr_accessor
attr_writer
attr_reader

class Ab
  attr_accessor :m
end

or

class Ab
  attr_writer :m
  attr_reader :m
end


or

class Ab
  def m= # setr
  end
  def m # getr
  end
end


define_method # its just an another approach to define a method in ruby .
define_method("method_name") do | arg1, arg2 |
  code
end

EX:

define_method("ashok") do | arg1, arg2 |
  c = arg1 + arg2
end
ashok(10, 20)


method_missing # it get invokes when there is not method defined for same object .

class Papaya
  def hello
  end
  def method_missing(name, *args)
    args = *args
    name = name.to_s
    if name.match('ashok')
       args.inject("+")
    elsif name.match('manav')
       "call once more"
    else
      "No method found"
    end
  end
end
p = Papaya.new
p.hello
p.ashok(56, 45)
p.manav
Struct # binding arguments
Cust = Struct.new(:name, :address) do
  def x1
    puts name
  end
end

OR

class Cust
  def initialize(name, address)
   @name = name
  end
  def x1
     puts @name
  end
end

singleton property # allow you to add class methods at run time .



class Bz
end


def Bz.hello
  puts "Ashok, Here"
end

Bz.hello



has_one :through

class User
  has_one :account
  has_one :account_history, through: :account
end


class Account
  belongs_to :user
  has_one :account_history
end


class AccountHistory
  belongs_to :account
end


Now :

u = USer.find 1
uc = u.account
uc.account_history


Requirement
u = USer.find 1
u.account_history



has_many :through


class Doctor
  has_many :patinets, through: :appointment
end


class Patient
  has_many :doctors, through: :appointment
end


class Appointment
  belongs_to :doctor
  belongs_to :patient
  #some_more_columns, date, purpos , form_where
end





has_and_belongs_to_many




class Assembly
  has_and_belongs_to_many :patinets
end


class Parts
  has_and_belongs_to_many :doctors
end


class  AssemblyParts
  belongs_to :doctor
  belongs_to :patient
  # no extra colums allowed
end

assembly = Assembly.find 1
assembly.parts

parts = Part.find 1
parts.assemblies



class A
  public # optional
    def a1 # memeber of A class
      a3
    end
    def a2 # memeber of A class
      a3
    end
  protected
    def a3
      "hello"
    end
end
