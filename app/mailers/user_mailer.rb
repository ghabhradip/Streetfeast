class UserMailer < ActionMailer::Base
  #default from: "abhradip@streetfeast.in"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.test_email.subject
  #
  def send_email(str)
    @greeting = "Hi"

    mail to: "abhradip.brainium@gmail.com"
  end
end
