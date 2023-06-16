class WelcomeMailer < ApplicationMailer
    default from: 'notifications@example.com'

    def welcome_email(user)
        @url  = 'http://example.com/login'
        mail(to: user.email, subject: 'Welcome to My Awesome Site')
    end
end
