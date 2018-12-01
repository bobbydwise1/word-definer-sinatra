require('word')
require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('website testing', {:type => :feature}) do
  it('User adds some new words and defs to list') do
    visit('/')
    fill_in("word", :with => 'dog')
    fill_in('definition', :with => 'A woofer.')
    click_button('Create')
    expect(page).to have_content("dog")
  end

end
