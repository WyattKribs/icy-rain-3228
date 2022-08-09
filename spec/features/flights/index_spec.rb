require 'rails_helper'

RSpec.describe "flights index" do
  it "has a working route" do
    visit '/flights'
    expect(page).to have_content("Flights")
  end
end
