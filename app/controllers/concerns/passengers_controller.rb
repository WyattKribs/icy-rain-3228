class PassengersController < ApplicationController
  def update
    @passenger.update(passenger_params)
  end
end
