class UserDetail < ApplicationRecord
  # def self.assign_from_row(row)
  #   user = UserDetail.where(email: row[:email]).first_or_initialize
  #   user.assign_attributes row.to_hash.slice(:full_name, :country, :age)
  #   user
  # end
  def self.import(file)
    data    = Roo::Spreadsheet.open(file.path)
    headers = data.row(1)
    counter = 0
    data.each_with_index do |row, idx|
      next if idx == 0 # skip header
      # create hash from headers and cells
      user_data = Hash[[headers, row].transpose]
      if UserDetail.exists?(email: user_data['email'])
        puts "User with email '#{user_data['email']}' already exists"
        next
      end

      user    = UserDetail.new(user_data)
      counter += 1
      puts "Import success #{counter}"
      puts "Saving User with email #{user.email}"
      user.save!
    end
    counter
  end

  def self.to_csv
    attributes = %w[id full_name email country age]
    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |user|
        csv << user.attributes.values_at(*attributes)
      end
    end
  end

end
