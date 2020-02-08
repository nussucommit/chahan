class GenericMailer < ApplicationMailer
  default from: %("NUSSU Logistics" <test@nussulogistics.com>)

  def reject(booking)
    @items = booking.items
    @category = booking.category
    @quantity = booking.quantity
    @purpose = booking.purpose

    mail(to: get_recipient(booking),
         subject: "Booking rejected")
  end

  def accept(booking)
    mail(to: get_recipient(booking),
         subject: "Booking accepted")
  end

  private

  def get_recipient(booking)
    %("#{booking.name}" <#{booking.email}>)
  end


end
