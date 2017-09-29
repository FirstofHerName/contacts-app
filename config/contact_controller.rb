class ContactsController < ApplicationController
  def one_contact_action
  @contact = Contact.first
  render 'one_contact_page.html.erb'
  end
  def all_contact_action
    @contact = Contact.first
    render 'all_contact_page.html.erb'
  end
  def index
    @contacts = Contact.all
    search_term = params [:search_term]
    if search_term
      @contacts = @contacts.where ("first_name iLike ? OR last_name ilike ?", "%#{search_term}%",%#{search_term}%")
end
