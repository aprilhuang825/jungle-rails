class SessionsController < ApplicationController
  def new
  end

  def create
    person = Person.find_by_email(params[:email])

    # If user exists and password entered is correct
    if person && person.authenticate(params[:password])

      # Save user id as cookie so they stay logged in
      session[:person_id] = person.id
      redirect_to :root

    else 
      render :new
    end
  end

  def destroy
    session[:person_id] = nil
    redirect_to :root
  end
end