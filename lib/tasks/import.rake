require 'roo'
namespace :import do
  desc 'Import data from spreadsheet'
  task data: :environment do
    puts 'Importing Data' # add this line
    data    = Roo::Spreadsheet.open('private/import/rails.xlsx')
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

      user = UserDetail.new(user_data)
      counter += 1
      puts "Import success #{counter}"
      puts "Saving User with email #{user.email}"
      user.save!
    end
  end
end
