class DirectMessagesController < ApplicationController
  def index
    @user_details = UserDetail.all
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment'
      }
      format.csv { send_data @user_details.to_csv }
    end
  end

  def import
    count = UserDetail.import params[:file]
    redirect_to users_path, notice: "Import #{count} users"
  end
end