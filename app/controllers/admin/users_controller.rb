class Admin::UsersController < Admin::BaseController
  expose(:users) { User.all }

  def index
  end
end