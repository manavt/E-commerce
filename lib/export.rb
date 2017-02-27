class Export
  def self.in_json
    FileUtils.mkdir_p "#{Rails.root}/public/JSON"
    filepath = "#{Rails.root}/public/JSON/export_in_json.json"
    product = Product.includes(:images)
    record = product.collect { |p|
      [
        p.name,
        p.brand,
        p.product_type,
        p.price,
        (p.images.collect {|im|
          im.photo.path
          } if p.images.present?)
          ]
        }
    File.open(filepath, "w") { | foo |
      foo.write(record.to_json)
    }
  end
  def self.in_xml
      FileUtils.mkdir_p "#{Rails.root}/public/XML"
      filepath = "#{Rails.root}/public/XML/export_in_xml.xml"
      product = Product.includes(:images)
      record = product.collect { |p|
        [
          p.name,
          p.brand,
          p.product_type,
          p.price,
          (p.images.collect {|im|
            im.photo.path
            } if p.images.present?)
            ]
          }
      File.open(filepath, "w") { | foo |
        foo.write(record.to_xml)
      }
    end
end
