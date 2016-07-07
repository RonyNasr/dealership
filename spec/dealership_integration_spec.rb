require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the new dealership path', {:type => :feature}) do
  it('opens the form to create a new dealership') do
    visit('/')
    click_link("Add New Dealership")
    expect(page).to have_content("Add dealerships")
  end
end

describe('the dealerships list', {:type => :feature}) do
  it('opens the dealerships list path') do
    visit('/')
    click_link("See Dealership List")
    expect(page).to have_content("Dealerships")
  end
end

describe('the add dealership form path', {:type => :feature}) do
  it('creates a new dealership from user input and renders success page') do
    visit('/dealerships/new')
    fill_in("name", :with => "Chip's cars")
    click_button("submit")
    expect(page).to have_content("Success!")
    click_link("See Dealerships List")
    expect(page).to have_content("Dealerships")
    click_link("Chip's cars")
    expect(page).to have_content("Here are all the cars in this dealership:")
    click_link("Add a new vehicle")
    expect(page).to have_content("Add a vehicle to Chip's cars")
    fill_in("make", :with => "Ford")
    fill_in("model", :with => "Fiesta")
    fill_in("year", :with => "2000")
    click_button("Add Vehicle")
    expect(page).to have_content("Success!")
    click_link("See Vehicle List")
    expect(page).to have_content("Here are all the cars in this dealership:")
    click_link("Ford Fiesta 2000")
    expect(page).to have_content("Ford Fiesta 2000")
    click_link("Back to Dealership")
    expect(page).to have_content("Here are all the cars in this dealership:")
    click_link("Return to Main Page")
    expect(page).to have_content("Welcome to Dealership Central")
  end
end

describe('the add dealership form path', {:type => :feature}) do
  it('creates a new dealership from user input and renders success page') do
    visit('/dealerships/new')
    fill_in("name", :with => "Chip's cars")
    click_button("submit")
    expect(page).to have_content("Success!")
    click_link("Home")
    expect(page).to have_content("Welcome to Dealership Central")
  end
end
