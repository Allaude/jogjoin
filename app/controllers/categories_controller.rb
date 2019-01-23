class CategoriesController < ApplicationController
  before_action :set_category,  only: [ :show,    :update,  :delete ]
  before_action :authorize,   only: [ :create,  :update,  :delete ]

  def index
    @categories = Category.all
    render json: @categories
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      render json: { result: true,  msg: 'Category Created!',   category: @category },  status: :created
    else
      render json: { result: false,   category: @category.errors }, status: :unprocessable_entity
    end
  end

  def show
    render json: { result: true, category: @category }
  end

  def update
    if @category.update.(category_param)
      render json: { result: true, msg: 'Kategori berhasil diperbarui!', category: @category}
    else
      render json: { result: false, category: @category.errors }, status: :bad_request
    end
  end

  def delete
    if @category.destroy
      render json: { result: true, msg: 'Kategori telah dihapus!'}, status: 201
    else
      render json: { result: false, category: @category.errors}, status: :bad_request
    end
  end

  private

  def category_params
    params.permit(:name, :banner)
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def authorize
    render json: { result: false, msg: "You don't have the previlege!"}, status: :bad_request unless current_user.is_admin?
  end

end
