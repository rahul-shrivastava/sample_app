require 'spec_helper'

describe "StaticPages" do
  subject { page }
  shared_examples_for "all static pages" do
    it { should have_selector('title', text: full_title(page_title)) }
    it   {should have_selector('h1',text:heading)}
    end

  describe "Home Page" do
    before(:each) {visit home_path}
    let(:heading) {'Sample App'}
    let(:page_title) {''}
  end
  describe 'Help Page' do
    before(:each) do
      visit help_path
    end
    let(:heading) {'Help'}
    let(:page_title) {'Help'}
  end

describe 'About Page' do
  before(:each) do
    visit about_path
  end
  let(:heading) {'About Us'}
  let(:page_title) {'About Us'}
  end

  describe 'Contact Page' do
    before(:each) do
      visit contact_path
    end
    let(:heading) {'Contact'}
    let(:page_title) {'Contact'}
  end
end
