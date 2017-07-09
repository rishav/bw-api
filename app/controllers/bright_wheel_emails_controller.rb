class BrightWheelEmailsController < ApplicationController

  def create
    bright_wheel_email = BrightWheelEmail.new(email_params)
    if bright_wheel_email.save
      render json: { bright_wheel_email: bright_wheel_email }
    else
      render json: { errors: bright_wheel_email.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def email_params
    email_params = params.permit(:to, :to_name, :from, :from_name, :subject, :body)
  end

end
