class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" <lunu.testguru@gmail.com>}
  layout 'mailer'
end
