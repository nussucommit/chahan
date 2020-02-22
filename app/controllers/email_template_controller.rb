class EmailTemplateController < ApplicationController
  def index
    @templates = EmailTemplate.all
  end

  def create
    @template = EmailTemplate.new template_params

    if @template.save
      redirect_to email_template_index_path,
                  notice: 'Template succesfully saved!'  
    else
      redirect_to email_template_index_path,
                  alert: 'Could not save template!'
    end
  end

  private

  def template_params
    params.require(:email_template).permit(:content)
  end
end
