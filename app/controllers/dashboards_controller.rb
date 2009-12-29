class DashboardsController < ApplicationController
  def index
    today_start = Time.zone.now.strftime("%Y-%m-%d") + " 00:00:00" 
    today_end = Time.zone.now.strftime("%Y-%m-%d") + " 23:59:59" 
    @orders = Order.find(:all, :conditions => ["(created_at >= '#{today_start}' AND created_at <= '#{today_end}' )"])
    @total = @orders.collect{|order| order.total}.sum
  end
  
  def start
    @phone_person, @money_person = get_random_users
    @phone_person.
    UserMailer.deliver_phone_person_advise(@phone_person)    
    UserMailer.deliver_money_person_advise(@money_person)
  end

  def stop
    # Remove privileges to phone person
    # select the money person
    # Remove privileges to money person
    # send email with orders to phone person
    # send email with orders to money person
  end


  private

  def get_random_users()
    phone
    money
    begin
      users = User.find(:all)
      x = users.size
      phone = users.delete_at(rand(size))
      raise Exception.new() if phone.nil?
      money = users.delete_at(rand(size))
      raise Exception.new() if money.nil?
    rescue => e
      flash[:notice] = "Error when select the users"
      redirect_to dashboards_url
    end
    return phone, money
  end

end
