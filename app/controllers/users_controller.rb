class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @has_attended = @user.attended_events.past
    @will_attend = @user.attended_events.future
  end

end
