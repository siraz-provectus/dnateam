class UserDecorator < ApplicationDecorator
  delegate_all

  def status
    if object.locked_at?
      "Заблокирован (#{Russian::strftime(object.locked_at, "%e %B %Y")})"
    elsif object.status == 'approved' && object.provider?
      'Зарегистрирован, соц сеть'
    elsif object.status == 'approved'
      'Зарегистрирован, подтвержден'
    elsif object.status == 'declined'
      'Заявка на регистрацию отклонена'
    else
      'Подана заявка на регистрацию'
    end
  end
end
