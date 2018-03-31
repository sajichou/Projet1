class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 # require 'user_sanitizer'
  #require 'teacher_sanitizer'
  
 # protected

  #def devise_parameter_sanitizer
   # if resource_class == User
   #   User::ParameterSanitizer.new(User, :user, params)
   # elsif resource_class == Teacher
   #   Teacher::ParameterSanitizer.new(Teacher, :teacher, params)
   # else
    #  super # Use the default one
   # end
  #end
  
end

