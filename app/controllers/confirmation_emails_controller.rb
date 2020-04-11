class ConfirmationEmailsController < ApplicationController
  def index
    @emails = ConfirmationEmail.all
  end

  def new
    @email = ConfirmationEmail.new
  end

  def create
    email = ConfirmationEmail.new email_params
    if email.save
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
