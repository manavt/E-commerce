class Import
  def self.from_json
    file = File.open("#{Rails.root}/public/JSON/export_in_json.json", "r")
    json_parsed_file = JSON.parse(file.collect {|a| a}.first)
    total_record = json_parsed_file.count
    puts "Total count : #{total_record}"
    puts "Before running create Prouct count are : #{Product.count}"
    json_parsed_file.each do | p |
      product = Product.create(p.delete_if {|k ,v| k == "id"})
      product.save(validate: false)
      puts "Newly created product id is #{product.id}"
    end
    puts "After running create Prouct count are : #{Product.count}"
  end
end
