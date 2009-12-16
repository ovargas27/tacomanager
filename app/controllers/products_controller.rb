class ProductsController < ApplicationController
  before_filter :require_admin
  before_filter :require_user
  before_filter :load_product, :only => [:show, :edit, :update, :destroy]
  before_filter :load_vendors, :only => [:new, :create, :edit]

  def index
    @products = Product.all
  end
  
  def show
  end
  
  def new
    debugger
    @product = Product.new
  end
  
  def create
    @product = Product.new(params[:product])
    if @product.save
      flash[:notice] = "Successfully created product."
      redirect_to @product
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @product.update_attributes(params[:product])
      flash[:notice] = "Successfully updated product."
      redirect_to @product
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @product.destroy
    flash[:notice] = "Successfully destroyed product."
    redirect_to products_url
  end

private

  def load_product
    @product = Product.find(params[:id])
  end

  def load_vendors
    @vendors = Vendor.find(:all)
  end

end
