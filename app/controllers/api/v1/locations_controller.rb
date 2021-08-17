module Api
  module V1
    class LocationsController < ApplicationController
      before_action :set_location

      def show
        # render json: @location
        # render json: @location, include: ['recordings']
      end

      private

      def set_location
        @location = Location.find(params[:id])
      end
    end
  end
end