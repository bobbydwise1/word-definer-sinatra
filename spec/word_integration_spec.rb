require('word')
require('capybara')
require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('website testing', {:type => :feature}) do
  it('User adds some new words and defs to list') do
    visit('/')
    fill_in('word', :with => 'dog')
    fill_in('definition', :with => 'A woofer.')
    click_button('Create')
    fill_in('word', :with => 'cat')
    fill_in('definition', :with => 'A meower.')
    click_button('Create')
    expect(page).to have_content("Edit word: dog")
  end

  it('Go to word definition page') do
    visit('/')
    click_button('Edit word: dog')
    expect(page).to have_content('The word you have picked is:')
  end

  it('Go to word definition page') do
    visit('/')
    click_button('Edit word: dog')
    fill_in('definition', :with => 'A barker.')
    click_button('Submit new definition')
    expect(page).to have_content('A barker.')
  end

end
