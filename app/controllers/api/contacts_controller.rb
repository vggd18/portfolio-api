class Api::ContactsController < ApplicationController
  # GET /contacts
  def index
    @contacts = Contact.recent
    render json: @contacts
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact, status: :created
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  private

  def contact_params
    params.require(:contact).permit(
      :name, 
      :email, 
      :subject, 
      :message
    )
  end
end
