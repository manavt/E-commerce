module DownloadFile
  extend ActiveSupport::Concern
  def download_in_csv
    FileUtils.mkdir_p "#{Rails.root}/public/CSV"
    filepath = "#{Rails.root}/public/CSV/report.csv"
    CSV.open(filepath, "a+") do | csv |
     csv << Product.column_names # set header
     Product.all.each do | p |
       csv << Product.connection.select_one("select * from products where id = '#{p.id}'").values
     end
    end
    send_file filepath, disposition: :attachment
  end
end
