class UserMailer < ActionMailer::Base
  def registration_confirmation(user)
    recipients  user.email
    from        "tacomanager@gmail.com"
    subject     "Thank you for Registering"
    body        :user => user
  end  
  
  def phone_person_advise(user)
    recipients  user.email
    from        "tacomanager@gmail.com"
    subject     "Congrats today you are the phone person"
    body        :user => user
  end

  def money_person_advise(user)
    recipients  user.email
    from        "tacomanager@gmail.com"
    subject     "Congrats today you are the money person"
    body        :user => user
  end

  def daily_orders_report(user, orders)
    recipients  user.email
    from        "tacomanager@gmail.com"
    subject     "the orders for today"
    body        :user => user, :orders => orders
  end

  
end
