require 'spec_helper'
require 'rails_helper'

feature "goal process" do

  before :each do
    visit "/users/new"
    fill_in "Username", with: 'ginger_baker'
    fill_in "Password", with: 'shorts'
    click_button 'Sign Up'
  end

  it "user page has goals" do
    expect(page).to have_content "Goals"
  end

  it "should be able to add a goal" do
    expect(page).to have_button "Create New Goal"
  end

  it "should list all goals"


end
