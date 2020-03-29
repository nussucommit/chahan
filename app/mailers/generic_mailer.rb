class GenericMailer < ApplicationMailer
  default from: %("NUSSU Logistics" <test@nussulogistics.com>)

  def reject
    mail(to: params[:address],
         subject: "Booking rejected",
         body: params[:content])
  end

  def approve
    mail(to: params[:address],
         subject: "Booking approved",
         body: params[:content])
  end

  private
end
