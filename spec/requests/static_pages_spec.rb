require 'spec_helper'

def static_pages_tag?(page_name, tag_name, string)
  visit "/static_pages/#{page_name}"
  page.should have_selector(tag_name, :text => string)
end

describe "StaticPages" do

  base_title = "Ruby on Rails Tutorial Sample App"

  describe "Home Page" do
    
    it "should have the h1 'Sample App'" do
      static_pages_tag?('home', 'h1', 'Sample App')
    end

    it "should have the base title" do
      static_pages_tag?('home', 'title', base_title)
    end

    it "should not have a custom page title" do
      visit '/static_pages/home'
      page.should_not have_selector('title', :text => '| Home')
    end
  end

  describe "Help Page" do

    it "should have the h1 'Help'" do
      static_pages_tag?('help', 'h1', 'Help')
    end

    it "should have the title 'Help'" do
      static_pages_tag?('help', 'title', "#{base_title} | Help")
    end
  end

  describe "About page" do 

    it "should have the h1 'About Us'" do
      static_pages_tag?('about', 'h1', 'About Us')
    end

    it "should have the title 'About Us'" do
      static_pages_tag?('about', 'title', "#{base_title} | About Us")
    end
  end

  describe "Contact page" do

    it "should have the h1 'Contact'" do
      static_pages_tag?('contact', 'h1', 'Contact')
    end

    it "should have the title 'Contact'" do
      static_pages_tag?('contact', 'title', "#{base_title} | Contact")
    end
  end
# Default: rails generate integration_test static_pages
#  describe "GET /static_pages" do
#    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
#      get static_pages_index_path
#      response.status.should be(200)
#    end
#  end
end
