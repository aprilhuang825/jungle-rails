class PeopleController < ApplicationController
  def new
  end

  def create  
    person = Person.new(person_params)

    if person.save
      session[:person_id] = person.id
      redirect_to :root, notice: 'User created!'
    else
      render :new
    end
  end

  private

  def person_params
    params.require(:person).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end
end