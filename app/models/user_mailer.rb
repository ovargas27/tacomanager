class UserMailer < ActionMailer::Base
  def registration_confirmation(user)
    recipients  user.email
    from        "ovargas27@gmail.com"
    subject     "Thank you for Registering"
    body        :user => user
  end  
end
