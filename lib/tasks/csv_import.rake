namespace :csv_import do
  desc "Import data from a CSV file"
  task :import, [:file_path] => :environment do |_, args|
    file_path = args[:file_path]
    if file_path.present? && File.exist?(file_path)
      CSV.foreach(file_path, headers: true) do |row|
        CryptoCurrency.create(name: row['Moneda'], monthlyInterest: row['Interes_mensual'], initialBalance: row['balance_ini'])
      end
      puts "CSV import successful"
    else
      puts "CSV file not found or path is missing"
    end
  end
end
