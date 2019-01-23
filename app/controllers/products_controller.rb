class ProductsController < ApplicationController
  before_action :set_product, only: [ :show, :update, :delete]
  before_action :authorize, only: [ :create, :update, :delete, :show_your_product]
  before_action :correct_user, only: [ :update, :delete]
  
  def index
    @products = Product.all
    render json: @products
  end

  def create
    @product = current_user.product.new(product_param)
    if @product.save
      render json: { result: true, msg: 'Product added!', product: @product}, status: :created
    else
      render json: { result: false, product: @product.errors}, status: :unprocessable_entity
    end 
  end

  def update
    if @product.update(product_param)
      render json: { result: true, product: @product}, status: :created
    else
      render json: { result: false, product: @product.errors}, status: :bad_request
    end
  end

  def delete
  if @product.destroy
    render json: { result: true,  msg: "Produk deleted!"}, status: 201
  else
    render json: { result: false, msg: "This is not your product"}, status: :bad_request
    end
  end

  def show
    render json: { result: true, product: @product }
  end

  def show_your_product
    @products = current_user.product.all
    render json: { result: true, products: @products} 
  end

  def show_by_userid
    @user = User.find(params[:id])
    @product = @user.product
    render json: { result: true, products: @products}
  end
  
  def show_by_category
    @category = Category.find(params[:id])
    @products = @category.product
    render json: { result: true, products: @products}
  end

  private

  def product_param
    params.permit(:name, :price, :description, :stock, :photo, :category_id, :user)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def authorize
    render json: { result: false, msg: "You don't have the previlege!"}, status: :bad_request unless current_user.is_merchant?
  end

  def correct_user
    @product = Product.find(params[:id])
    render json: { result: false, msg: "You're not allowed for this action."} unless @product.user != current_user.id
  end

end
