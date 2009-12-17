class DashboardsController < ApplicationController
  def index
    today_start = Time.zone.now.strftime("%Y-%m-%d") + " 00:00:00" 
    today_end = Time.zone.now.strftime("%Y-%m-%d") + " 23:59:59" 
    @orders = Order.find(:all, :conditions => ["(created_at >= '#{today_start}' AND created_at <= '#{today_end}' )"])
    @total = @orders.collect{|order| order.total}.sum
  end
end
