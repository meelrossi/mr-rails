class RentsController < ApplicationController
  def index
    rents = paginate(Rent)
    render json: rents, status: :ok
  end

  def create
    if Rent.create(rent_params).valid?
      head :ok
    else
      render json: { error: 'Not able to create rent' }, status: :bad_request
    end
  end

  def rent_params
    params.require(:rent).permit(:book_id, :user_id, :from, :to)
  end
end
