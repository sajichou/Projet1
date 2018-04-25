require 'test_helper'

class TeacherMailerTest < ActionMailer::TestCase
  test "validated" do
    mail = TeacherMailer.validated
    assert_equal "Validated", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "inscription" do
    mail = TeacherMailer.inscription
    assert_equal "Inscription", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
