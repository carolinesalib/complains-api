class Api::V1::ComplainsController < ApplicationController
  def index
    complains = Complain.includes(:user).joins(:user).where(users: { email: params[:email] })
    render json: complains
  end

  def create
    email = params[:email]

    return unless email.present?

    user = User.find_or_create_by(email: email)

    Complain.create(user: user)
  end

  def undo
    user = User.find_or_create_by(email: params[:email])

    if user.present?
      Complain.where(user: user).last.delete
    end
  end
end
