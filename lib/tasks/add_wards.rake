namespace :add_wards do
  require 'net/http'
  desc 'Get a Districts'
  task execute: [:environment] do
    source = 'https://provinces.open-api.vn/api/w/'
    resp   = Net::HTTP.get_response(URI.parse(source))
    data   = resp.body
    result = JSON.parse(data)
    # puts result
    result.each do |ward|
      ward_save = Ward.new do |p|
        p.name          = ward['name']
        p.code          = ward['code']
        p.codename      = ward['codename']
        p.division_type = ward['division_type']
        p.district_code = ward['district_code']
      end
      ward_save.save
    end
  end
end 
