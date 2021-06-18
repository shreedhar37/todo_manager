class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.order(:id).map { |user| user.to_pleasant_string }.join("\n\n")
  end

  def login
    record = User.find_by(email: params[:email], password: params[:password])
    result = record ? "Welcome #{record.name}" : "Invalid Credentials!!!"
    render plain: result
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    valid_input = name.present? && email.present? && password.present?
    user = valid_input ? User.create!(name: name, email: email, password: password) : nil
    response_text = user.present? ? "Hey, your account is created with id #{user.id}" : "Input can't be empty!! "
    render plain: response_text
  end
end
