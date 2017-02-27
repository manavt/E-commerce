class Mygem
  class << self
    def calc(op, *args)
      array = *args
      return array if array.count == 1
      result = array.inject(op)
      return result
    end
  end
end
