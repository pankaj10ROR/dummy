require "test_helper"

class WelcomeproductMailerTest < ActionMailer::TestCase
  test "send_greeting_to_seller_for_approved_notification" do
    mail = WelcomeproductMailer.send_greeting_to_seller_for_approved_notification
    assert_equal "Send greeting to seller for approved notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
