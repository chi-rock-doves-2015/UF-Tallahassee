#unsure best way to use this - was looking at https://robots.thoughtbot.com/rspec-integration-tests-with-capybara

require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the CreateUsersHelper. For example:
#
# describe CreateUsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe CreateUsersHelper, type: :helper do
  pending "add some examples to (or delete) #{__FILE__}"
end
