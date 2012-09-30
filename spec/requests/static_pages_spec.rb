require 'spec_helper'

describe "StaticPages" do
  subject { page }
  describe "Home Page" do
    before(:each) do
      visit home_path
    end
    it 'should have the title as Sample App ' do
      should have_selector('h1',:text=>'Sample App')
    end
    it 'should have title ' do
      should have_selector('title',:text=>"Ruby on Rails Tutorial Sample App")
    end
  end
  describe 'Help Page' do
    before(:each) do
      visit help_path
    end
    it "should have the content as 'help'" do
          should have_selector('h1',:text=>'Help')
    end
    it "should have title as 'Help'" do
      should have_selector('title',:text=>full_title("Help") )
    end
  end

describe 'About Page' do
  before(:each) do
    visit about_path
  end
  it "should have the content 'About us'" do
    should have_selector('h1',:text=>'About Us')
  end
  it "should have title as 'About us'" do
    should have_selector('title',:text=>full_title("About Us") )
    end
  end

  describe 'Contact Page' do
    before(:each) do
      visit contact_path
    end
    it "should have the content 'Content'" do
      should have_selector('h1',:text=>'Contact')
    end
    it "should have the title 'Contact'" do
      should have_selector('title',:text=>full_title('Contact') )
    end
  end
end
