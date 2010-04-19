ActionController::Routing::Routes.draw do |map|
  map.resources :orders

  map.resources :vendors

  map.resources :products

  map.resources :users

  map.start "start", :controller =>"dashboards", :action => "start"
  map.stop "stop", :controller =>"dashboards", :action => "stop"

  map.login "login", :controller =>"user_sessions", :action => "new"
  map.logout "logout", :controller =>"user_sessions", :action => "destroy"

  map.resources :user_sessions
  map.resources :users
  map.resources :password_resets
  map.root :controller => "dashboards"


end
