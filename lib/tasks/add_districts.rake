namespace :add_districts do
  require 'net/http'
  desc 'Get a Districts'
  task :execute => [:environment] do
    source = 'https://provinces.open-api.vn/api/d/'
    resp   = Net::HTTP.get_response(URI.parse(source))
    data   = resp.body
    result = JSON.parse(data)
    # puts result
    result.each do |district|
      puts district
      district_save = District.new do |p|
        p.name          = district['name']
        p.code          = district['code']
        p.codename      = district['codename']
        p.province_code = district['province_code']
        p.division_type = district['division_type']
        p.codename      = district['codename']
      end
      district_save.save
    end
  end
end 
