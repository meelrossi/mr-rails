class RentsController < ApplicationController
  def index
    rents = current_user.rents.where(filter_params).paginate(params)
    render json: rents, status: :ok
  end

  def create
    rent = current_user.rents.create(create_params)
    if rent.valid?
      ApplicationMailer.new_rent_notification(rent).deliver_later
      head :created
    else
      render json: { error: 'Not able to create rent' }, status: :bad_request
    end
  end

  private

  def filter_params
    params.permit(:book_id, :from, :to)
  end

  def create_params
    params.require(:rent).permit(:book_id, :from, :to)
  end
end
