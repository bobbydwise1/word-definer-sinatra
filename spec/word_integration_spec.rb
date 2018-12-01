require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require ('rspec')
require('word')
require ('pry')
require ('capabara')

require('favorite')
require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('website testing', {:type => :feature}) do
  it('user input favorite item to list') do
    visit('/')
    fill_in('user_input', :with => 'dog')
    click_button('Submit')
    expect(page).to have_content(["dog"])
  end

end
