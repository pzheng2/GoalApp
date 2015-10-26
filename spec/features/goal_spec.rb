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
    user = User.create!(username: "test human", password: "testing")
    user.goals.create!(title: "My Goal", private: true)
    user.goals.create!(title: "PUBLICGOAL")
    visit user_url(user)
    save_and_open_page
    expect(page).to_not have_content 'My Goal'
  end


end
