class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash[:notice] = 'Thank you for your message. We will contact you soon!'
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = 'Cannot send message.'
      render :new
    end
  end
end
