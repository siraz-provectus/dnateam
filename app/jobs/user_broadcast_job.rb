class UserBroadcastJob < ApplicationJob
  queue_as :default

  def perform(user)
    ActionCable.server.broadcast 'admin_users_channel', message: render_user(user)
  end

  private

  def render_user(user)
    ApplicationController.renderer.render(partial: 'admin/users/item', locals: { user: user })
  end
end
