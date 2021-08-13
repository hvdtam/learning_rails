class UserDetail < ApplicationRecord
  def self.import(file)
    data          = Roo::Spreadsheet.open(file.path)
    count_failed  = 0
    count_success = 0
    data.parse(
      email:     'E mail',
      full_name: 'Full Name',
      age:       "Age",
      location:  "Location",
      dob:       "Dob"
    ).each do |hash|
      if UserDetail.exists?(email: hash['email'])
        puts "User with Email #{hash['email']} already exists"
        count_failed += 1
        next
      end
      user = UserDetail.new(hash)
      puts "Saving User with email '#{user.email}'"
      count_success += 1
      user.save!
    end
    puts "Import Success #{count_success}"
    puts "Import Failed #{count_failed}"
  end
end
