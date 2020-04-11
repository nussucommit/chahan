class ConfirmationEmailsController < ApplicationController
  def index
    @emails = ConfirmationEmail.all
  end

  def new
    @email = ConfirmationEmail.new

    booking = Booking.find params[:booking_id]
    if booking.status == 'rejected'
      @email.subject = "Booking rejected"
    elsif booking.status == 'approved'
      @email.subject = "Booking approved"
    end

    @email.recipient = booking.email

    @template = EmailTemplate.find params[:template_id]
    @email.content = @template.content
  end

  def create
    email = ConfirmationEmail.new email_params
    if email.save
      GenericMailer.with(address: email.recipient, subject: email.subject, content: email.content).send_email.deliver_now
      redirect_to bookings_path, notice: "Sent email!"
    else
      @email = email
      flash.now[:alert] = "Failed to send email:
                          #{email.errors.full_messages.join(', ')}"
      render new_confirmation_email_path
    end
  end

  private

  def email_params
    params.require(:confirmation_email).permit(:recipient, :subject, :content)
  end
end
