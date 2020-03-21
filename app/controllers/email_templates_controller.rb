class EmailTemplatesController < ApplicationController
  def index
    @templates = EmailTemplate.all
  end

  def new
    @template = EmailTemplate.new
  end

  def create
    @template = EmailTemplate.new template_params

    if @template.save
      redirect_to email_templates_path,
                  notice: 'Template succesfully saved!'  
    else
      redirect_to email_templates_path,
                  alert: 'Could not save template!'
    end
  end

  def show
    @template = EmailTemplate.find params[:id]
  end

  def select
    @templates = EmailTemplate.all
    @booking_id = params[:booking_id]
  end

  def adapt
    @template = EmailTemplate.find params[:id]
    @booking = Booking.find params[:booking_id]
  end

  private

  def template_params
    params.require(:email_template).permit(:content, :name)
  end
end
