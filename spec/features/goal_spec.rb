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

  it "should list goals" do
    fill_in "Title", with: 'My Goal'
    fill_in "Description", with: 'Finish this goal!'
    click_button 'Create New Goal'
    expect(page).to have_content "My Goal"
  end

  it "shouldn't display private goals to others" do
    fill_in "Title", with: 'My Goal'
    fill_in "Description", with: 'Finish this goal!'
    click_button 'Create New Goal'
    click_button 'Sign Out'
    click_link 'Sign Up'
    fill_in "Username", with: 'different_name'
    fill_in "Password", with: 'shorts'
    click_button 'Sign Up'
    user = User.last
    visit user_url(user)
    expect(page).to_not have_content 'My Goal'
  end


end
