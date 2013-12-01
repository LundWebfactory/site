require 'spec_helper'

describe "Static pages" do 
  
  describe "Home page" do
  	it "should have the content 'Fresh'" do
  		visit '/static_pages/home'
  		expect(page).to have_content('Fresh')
	end
	it "should have the title 'Home'" do
        visit '/static_pages/home'
        expect(page).to have_title("Home")
    end
  end
  describe "Signup page" do
  	it "should have the content 'Sign'" do
  		visit '/signup'
  		expect(page).to have_content('Sign')
	end
	it "should have the title 'Signup'" do
        visit '/signup'
        expect(page).to have_title("Signup")
    end
  end

end
