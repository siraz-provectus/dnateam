class HomeController < ApplicationController
  before_action :add_flash_message

  def index
  end

  private

  def add_flash_message
    flash.notice =  if current_user.url.present? && current_user.status == 'approved'
                      "Добро пожаловать, #{current_user.first_name} \n
                      вы успешно авторизовались через социальную сеть"
                    elsif current_user.status == 'pending'
                      "Ваша заявка на регистрацию находится на рассмотрении у модератора"
                    elsif current_user.status == 'approved'
                      "Спасибо #{current_user.first_name}, \n
                       Ваша заявка на регистрацию успешно подтверждена модератором,\n добро пожаловать!"
                    elsif current_user.status == 'declined'
                      "К сожалению, #{current_user.first_name}, \n
                       Ваша заявка на регистрацию отклонена из-за несоответствия\n переданных данных"
                    end
  end
end