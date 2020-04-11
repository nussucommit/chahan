class GenericMailer < ApplicationMailer
  default from: %("NUSSU Logistics" <test@nussulogistics.com>)
  
  def send_email
    mail(to: params[:address],
         subject: params[:subject],
         body: params[:content])
  end

  private
end
