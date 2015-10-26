require 'spec_helper'
require 'rails_helper'

feature "user comment features" do

  before :each do
    visit "/users/new"
    fill_in "Username", with: 'ginger_baker'
    fill_in "Password", with: 'shorts'
    click_button 'Sign Up'
    fill_in "Comment Body", with: "aasdfasdfasgdaweee"
    click_button "Comment"
  end

  it "should have comment" do
    expect(page).to have_content "aasdfasdfasgdaweee"
  end

  it "should delete comments" do
    click_button "delete comment"
    expect(page).to_not have_content "aasdfasdfasgdaweee"
  end
end


feature "goal comment features" do
  before :each do
    visit "/users/new"
    fill_in "Username", with: 'ginger_baker'
    fill_in "Password", with: 'shorts'
    click_button 'Sign Up'
    fill_in "Title", with: 'My Goal'
    fill_in "Description", with: 'Finish this goal!'
    click_button 'Create New Goal'
  end

  it 'should make a goal comment' do
    fill_in 'Goal Comment', with: 'alksdfj'
    click_button 'Comment on Goal'
    expect(page).to have_content 'alksdfj'
  end

  it "should delete goal comments" do
    fill_in 'Goal Comment', with: 'alksdfj'
    click_button 'Comment on Goal'
    click_button "delete goal comment"
    expect(page).to_not have_content "alksdfj"
  end


end
