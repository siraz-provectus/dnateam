class Admin::UsersController < Admin::BaseController
  expose(:users) { User.all }
  expose(:user) { User.find(params[:id]) }

  def index
  end

  def update
    flash.clear()
    user.update(user_params)
    if user.errors.blank?
      flash.notice = 'Успешно обновлено'
    else
      flash.alert = 'Произошла ошибка'
    end
  end

  private

  def user_params
    params.require(:user).permit( :status, :locked_at)
  end
end