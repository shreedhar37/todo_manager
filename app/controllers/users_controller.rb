class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.order(:id).map { |user| user.to_pleasant_string }.join("\n\n")
  end

  def login
    record = User.find_by("email = ?  and pswd = ?", params[:email], params[:pswd])
    result = record ? "Welcome #{record.name}" : "Invalid Credentials!!!"
    render plain: result
  end

  def create
    name = params[:name]
    email = params[:email]
    pswd = params[:pswd]

    input = (name == nil || email == nil || pswd == nil) ? nil : User.create!(name: name, email: email, pswd: pswd)
    response_text = input == nil ? "Input can't be empty!! " : "Hey, your account is created with id #{input.id}"
    #response_text = "Hey, your account is created with id #{new_user.id}"
    render plain: response_text
  end
end
