require 'spec_helper'
require 'rails_helper'

feature "the signup process" do
  before :each do
    visit "/users/new"
  end

  it "has a new user page" do
    expect(page).to have_content "Sign Up"
  end

  feature "signing up a user" do

    it "shows username on the homepage after signup" do
      fill_in "Username", with: 'ginger_baker'
      fill_in "Password", with: 'shorts'
      click_button 'Sign Up'
      expect(page).to have_content "ginger_baker"
    end

  end

end

feature "logging in" do
  before :each do
    visit "/users/new"
  end

  it "shows username on the homepage after login" do
    fill_in "Username", with: 'ginger_baker'
    fill_in "Password", with: 'shorts'
    click_button 'Sign Up'
    click_button 'Sign Out'
    fill_in "Username", with: 'ginger_baker'
    fill_in "Password", with: 'shorts'
    click_button 'Sign In'
    expect(page).to have_content "ginger_baker"
  end

end

feature "logging out" do
  before :each do
    visit "/users/new"
  end

  it "begins with logged out state" do
    expect(page).to have_content "Sign Up"
    expect(page).to have_content "Sign In"
  end

  it "doesn't show username on the homepage after logout" do
    fill_in "Username", with: 'ginger_baker'
    fill_in "Password", with: 'shorts'
    click_button 'Sign Up'
    click_button 'Sign Out'
    expect(page).to have_content "Sign Up"
    expect(page).to have_content "Sign In"
    expect(page).to_not have_content "ginger_baker"
  end

end
