class RentsController < ApplicationController
  def index
    rents = paginate(Rent)
    render json: rents, status: :ok
  end

  def create
    rent = Rent.create(rent_params)
    if rent.valid?
      ApplicationMailer.new_rent_notification(rent).deliver_later
      head :ok
    else
      render json: { error: 'Not able to create rent' }, status: :bad_request
    end
  end

  def rent_params
    params.require(:rent).permit(:book_id, :user_id, :from, :to)
  end
end
