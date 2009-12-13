class UsersController < ApplicationController
  before_filter :load_user, :only => [:edit, :update, :show]
  before_filter :require_user, :only => [:edit, :update, :show]


  def index
    @users = User.find(:all)
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Registration successfull."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated user."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end

  def show
  end

protected
  
  def load_user
    @user = User.find(params[:id])
  end

end
