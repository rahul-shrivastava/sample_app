require 'spec_helper'

describe "StaticPages" do
  describe "Home Page" do
    it 'should have the title as Sample App ' do
      visit '/static_pages/home'
      page.should have_selector('h1',:text=>'Sample App')
    end
    it 'should have title ' do
      visit '/static_pages/home'
      page.should have_selector('title',:text=>"Ruby on Rails Tutorial Sample App | Home")
    end
  end
  describe 'Help Page' do
    it "should have the content as 'help'" do
          visit '/static_pages/help'
          page.should have_selector('h1',:text=>'Help')
    end
    it "should have title as 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('title',:text=>"Ruby on Rails Tutorial Sample App | Help")
    end
  end

describe 'About Page' do
  it "should have the content 'About us'" do
    visit '/static_pages/about'
    page.should have_selector('h1',:text=>'About Us')
  end
  it "should have title as 'About us'" do
    visit '/static_pages/about'
      page.should have_selector('title',:text=>"Ruby on Rails Tutorial Sample App | About Us")
    end
  end

  describe 'Contact Page' do
    it "should have the content 'Content'" do
      visit '/static_pages/contact'
      page.should have_selector('h1',:text=>'Contact')
    end
    it "should have the title 'Contact'" do
      visit '/static_pages/contact'
      page.should have_selector('title',:text=>'Ruby on Rails Tutorial Sample App | Contact')
    end
  end
end
