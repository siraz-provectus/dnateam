class Admin::BaseController < ApplicationController
  before_action :check_admin_rights
  before_action :clear_flash
  layout 'admin'

  private

  def check_admin_rights
    return redirect_to root_url if current_user.blank? || !current_user.admin?
  end

  def clear_flash
    flash.clear()
  end
end