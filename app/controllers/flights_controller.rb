class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @airlines = Airline.all
    @passengers = Passenger.all
  end

end
