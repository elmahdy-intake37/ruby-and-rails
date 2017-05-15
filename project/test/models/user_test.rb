require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
#test case on sign in
  test "should show profile" do
    # helper is now reusable from any controller test case
    sign_in_as users(:instructor)

    get profile_url
    assert_response :success
  end
  test "should showing profile" do
  sign_in_as users(:student)

  get profile_url
  assert_response :success
end

test 'that account is charged' do
   BillingJob.perform_now(account, admin)
   assert account.reload.charged_for?(admin)
 end
end
