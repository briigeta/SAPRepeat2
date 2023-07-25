class RegistrationsController < Devise::RegistrationsController
    def create
      super do |resource|
        if resource.persisted?
          sign_in(resource)
          flash[:notice] = "Welcome! Your account was successfully created."
          redirect_to passwords_path 
        end
      end
    end
  end
  