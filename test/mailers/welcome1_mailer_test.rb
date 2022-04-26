require "test_helper"

class Welcome1MailerTest < ActionMailer::TestCase
  test "send_greetings_to_seller__notification" do
    mail = Welcome1Mailer.send_greetings_to_seller__notification
    assert_equal "Send greetings to seller  notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
