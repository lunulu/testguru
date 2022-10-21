class FeedbackMailer < ApplicationMailer
  def feedback(user, text)
    @user = user
    @text = text

    mail to: 'lunu.testguru@gmail.com',
         subject: 'Feedback',
         from: %("#{@user.first_name} #{@user.last_name}" <#{@user.email}>)
  end
end
