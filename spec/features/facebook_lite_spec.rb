require 'rails_helper'

RSpec.feature 'Facebook Lite', type: :feature do
  #
  # follow the scenarios and remove one `skip` at a time to fix the application
  #

  scenario 'fix the welcome page' do
    skip 'remove me to start'

    visit root_path
    expect(page.status_code).to eq 200
  end

  scenario 'fix unnecessary authentication' do
    skip 'remove me if you can'

    visit root_path
    expect(page).to_not have_content 'Y U NO authenticate?'
    within '.navbar-brand' do
      expect(page).to have_content 'Facebook Lite'
    end
    expect(page).to have_content 'Posts by all the people'
    within 'form' do
      expect(page).to have_content 'Login'
    end
  end

  scenario 'fix the sign up' do
    skip 'remove me if you can'

    visit new_user_path
    expect(page).to have_content 'Sign Up!'
    fill_in 'user_name', with: 'Bob'
    fill_in 'user_email', with: 'bob@somewhere.com'
    fill_in 'user_password', with: '123456'
    fill_in 'user_password_confirmation', with: '123456'
    click_on 'New Account'
    expect(page).to have_content 'Your account was created successfully!'
    expect(page).to have_content 'What\'s up Bob?'
  end

  scenario 'fix the login' do
    skip 'remove me if you can'

    visit root_path
    form_login User.create!(name: 'Bob', email: 'bob@somewhere.com', password: '123456')
    expect(page).to have_content 'Welcome Bob'
  end

  scenario 'fix some bugs around postings' do
    skip 'remove me if you can'

    form_login User.create!(name: 'Bob', email: 'bob@somewhere.com', password: '123456')
    fill_in 'post_content', with: 'Wooah so many bugs!'
    click_on 'To all the people!'
    expect(page).to have_content 'Post successfully created'
    within '.media' do
      expect(page).to have_content 'Wooah so many bugs!'
    end
  end

  scenario 'fix a scary security bug' do
    skip 'remove me if you can'

    bob = User.create!(name: 'Bob', email: 'bob@somewhere.com', password: '123456')
    bob.posts.create(content: 'Ohai Alice')
    alice = User.create!(name: 'Alice', email: 'alice@nowhere.com', password: 'secret')
    alice.posts.create(content: 'Hey Bob!')
    form_login bob
    within('[rel=bob-post]') do
      expect(page).to have_content('Edit Delete')
      expect(page).to have_content('Ohai Alice')
    end
    within('[rel=alice-post]') do
      expect(page).to have_content('Hey Bob!')
      expect(page).to_not have_content('Edit Delete')
    end
  end

  scenario 'fix posts#edit' do
    skip 'remove me if you can'

    alice = User.create!(name: 'Alice', email: 'alice@nowhere.com', password: '123456')
    alice.posts.create(content: 'This app is totally broken!!!')
    form_login alice
    within('[rel=alice-post]') do
      click_on 'Edit'
    end
    expect(page).to have_content('Editing post')
    fill_in 'post_content', with: 'Ok, seems like the App is fixed now! Cool!'
    click_on 'To all the people!'
    expect(page).to have_content('Post successfully updated')
    expect(page).to have_content('App is fixed now!')
  end
end
