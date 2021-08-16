namespace :add_provinces do
  require 'net/http'
  desc 'Get a Districts'
  task execute: [:environment] do
    source = 'https://provinces.open-api.vn/api/p/'
    resp   = Net::HTTP.get_response(URI.parse(source))
    data   = resp.body
    result = JSON.parse(data)
    # puts result
    result.each do |province|
      puts province
      province_save = Province.new do |p|
        p.name          = province['name']
        p.code          = province['code']
        p.phone_code    = province['phone_code']
        p.division_type = province['division_type']
        p.codename      = province['codename']
      end
      province_save.save
    end
  end
end 
