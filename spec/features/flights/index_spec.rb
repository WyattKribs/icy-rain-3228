require 'rails_helper'

RSpec.describe "flights index" do
  it "has a working route" do
    visit '/flights'
    expect(page).to have_content("Flights")
  end

  it "displays each flight, the associated airline, and all the passengers" do
    airline1 = Airline.create!(name: "Blue Air")
    airline2 = Airline.create!(name: "Red Air")
    flight1 = Flight.create!(number: "201", date: "July 1st",
      departure_city: "Cincinnati", arrival_city: "Denver", airline_id: airline1.id)
    passenger1 = Passenger.create!(name: "Billy", age: 14, flight_ids: [flight1.id])

    visit '/flights'

    expect(page).to have_content("Flight #201")
    expect(page).to have_content("Blue Air")
    expect(page).to have_content("Billy")
  end

  it "should have a button that removes passengers" do
    airline1 = Airline.create!(name: "Blue Air")
    airline2 = Airline.create!(name: "Red Air")
    flight1 = Flight.create!(number: "201", date: "July 1st",
      departure_city: "Cincinnati", arrival_city: "Denver", airline_id: airline1.id)
    passenger1 = Passenger.create!(name: "Billy", age: 14, flight_ids: [flight1.id])

    visit '/flights'

    save_and_open_page
    expect(page).to have_link("Remove")
    click_link("Remove")
    expect(current_path).to eq(flights_path)

  end



end
