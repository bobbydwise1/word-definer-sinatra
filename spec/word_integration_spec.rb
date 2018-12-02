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
    expect(page).to have_content("dog")  ##fails here
  end

  it('Go to word definition page') do
    visit('/')
    fill_in('word', :with => 'dog')
    fill_in('definition', :with => 'A woofer.')
    click_button('Create')
    fill_in('word', :with => 'cat')
    fill_in('definition', :with => 'A meower.')
    click_button('Create')
    click_button('Edit word: dog')  ##fails here
    expect(page).to have_content('The word you have picked is:')
  end

  it('Go to word definition page') do
    visit('/')
    fill_in('word', :with => 'dog')
    fill_in('definition', :with => 'A woofer.')
    click_button('Create')
    fill_in('word', :with => 'cat')
    fill_in('definition', :with => 'A meower.')
    click_button('Create')
    click_button('Edit word: dog')  ##fails here
    fill_in('definition', :with => 'A barker.')
    click_button('Submit new definition')
    expect(page).to have_content('A barker.')
  end

end
