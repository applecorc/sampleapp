require 'spec_helper'

describe "following" do
  describe "creation" do
    before(:each) do
      other = Factory(:user)
      integration_sign_in(other)
      click_link "Sign out"
      user = Factory(:user, :email => Factory.next(:email))
      integration_sign_in(user)
    end
    
    it "should change following count" do
      visit user_path(1)
      click_button
      visit root_path
      response.should have_selector("a", :content => "1 following")
      visit user_path(1)
      click_button
      visit root_path
      response.should have_selector("a", :content => "0 following")
    end
  end
end