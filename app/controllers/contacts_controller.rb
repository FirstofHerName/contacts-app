class ContactsController < ApplicationController
  def index
    @contacts = Contact.all

    search_term = params[:search_term]
    if search_term
      @contacts = @contacts.where("first_name iLIKE ? OR last_name iLIKE ? OR email iLIKE ?", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%")
    end 
  end

  def show
    @contact = Contact.find_by(id: params[:id])
  end

  def new
    
  end

  def create
    @contact = Contact.new(
                          first_name: params[:first_name], 
                          middle_name: params[:middle_name], 
                          last_name: params[:last_name], 
                          email: params[:email], 
                          bio: params[:bio], 
                          phone_number: params[:phone_number]
                          )
    if @contact.save
    flash[:success] = "Contact created."
    redirect_to "/contacts/#{contact.id}"
  else
    @errors = @contacts.errors.full_messages
    render "new.html.erb"
  end

  def edit
    @contact = Contact.find_by(id: params[:id])
  end

  def update
    @contact = Contact.find_by(id: params[:id])
    contact.assign_attributes(
                              first_name: params[:first_name], 
                              middle_name: params[:middle_name],
                              last_name: params[:last_name], 
                              email: params[:email], 
                              bio: params[:bio], 
                              phone_number: params[:phone_number]
                              )
    if @contact.save
    flash[:success] = "Contact updated."
    redirect_to "/contacts/#{contact.id}"
  end
    @errors = @product.errors.full_messages
    render "new.html.erb"

  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy
    flash[:warning] = "Contact deleted."
    redirect_to "/"
  end
end