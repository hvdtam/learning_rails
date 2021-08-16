class ProvincesController < ApplicationController
  def index
    @provinces = Province.search "*", aggs: {
      code:          {},
      division_type: {},
      phone_code:    {},
      codename:      {}
    }
  end
end
