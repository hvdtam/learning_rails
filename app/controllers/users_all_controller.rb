class UsersAllController < ApplicationController
  def index
    @users = User.all
    @users_decorators = @users.map { |user| UserDecorator.new(user, view_context) }
  end
end
