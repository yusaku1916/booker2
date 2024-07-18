class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super
    flash[:notice] = "Welcome! You have signed up successlly."
  end
end
