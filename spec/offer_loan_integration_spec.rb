# require('capybara/rspec')
#   require('./app')
#   Capybara.app = Sinatra::Application
#   set(:show_exceptions, false)

# describe('the account path', {:type => :feature}) do
#     it('processes the user entry and returns pingponged numbers') do
#       visit('/')
#       fill_in('person',:with => ("marty")
#       fill_in('amnt', :with => 1000)
#       fill_in('months', :with => 4)
#       click_button('Send')
#       expect(page).to have_content("marty", 1100, 4)
#     end
#   end
