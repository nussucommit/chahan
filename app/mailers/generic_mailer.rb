class GenericMailer < ApplicationMailer
  default from: %("NUSSU Logistics" <test@nussulogistics.com>)

  def reject
    booking = params[:booking]
    @items = booking.items
    @category = booking.category
    @quantity = booking.quantity
    @purpose = booking.purpose

    puts '======================='
    puts 'rejected'

    mail(to: get_recipient(booking),
         subject: "Booking rejected",
         template_path: 'generic_mailer',
         template_name: 'reject')
    
    
  end

  def approve
    booking = params[:booking]
    @items = booking.items
    @category = booking.category
    @quantity = booking.quantity
    @purpose = booking.purpose

    mail(to: get_recipient(booking),
         subject: "Booking approved",
         template_path: 'generic_mailer',
         template_name: 'approve')
  end

  private

  def get_recipient(booking)
    %("#{booking.name}" <#{booking.email}>)
  end


end
