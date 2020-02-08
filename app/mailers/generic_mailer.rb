class GenericMailer < ApplicationMailer
  default from: %("NUSSU Logistics" <test@nussulogistics.com>)

  def reject(booking)

  end

  def accept(booking)
  end
end
