class ProductsController < ApplicationController
  ############################
  def index
    p "check ss"

    p "==========gg==============="
    p current_user
    p"~~~~~~~~~~~~~~~~~~~~~"
    case params[:sort_by]
    when "title-ascending"
      @products = Product.order('name ASC')
    when "title-descending"
      @products = Product.order('name DESC')
    when "price-ascending"
      @products = Product.order('price ASC')
    when "price-descending"
      @products = Product.order('price DESC')
    else
      @products = Product.all
    end
    # p "========================"
    # p current_user

    @user= current_user

    @categories = Category.all
    @sl = []
    @categories.each do |q|
      a=Category.find_by_id(q.id).products.count
      @sl.push({name: q.name , sl: a})
    end

  end
  ############################3#
  def home
    p "===================="
    p flash[:success]
    case params[:sort_by]
    when "title-ascending"
      @products = Product.order('name ASC')
    when "title-descending"
      @products = Product.order('name DESC')
    when "price-ascending"
      @products = Product.order('price ASC')
    when "price-descending"
      @products = Product.order('price DESC')
    else
      @products = Product.all
    end
    # p "========================"
    # p current_user
    # p "========================="

    @categories = Category.all
    @sl = []
    @categories.each do |q|
      a=Category.find_by_id(q.id).products.count
      @sl.push({name: q.name , sl: a})
    end

  end
  #############################
  def new

  end
  def edit
    @product = Product.find_by_id(params[:id])
    authorize @product
  end
  ########################
  def create
    @product = Product.create(product_params)
    @product.save
    category_names = params[:category_name]
    category_names = category_names.split(",").map(&:strip).map(&:upcase)
    category_names.each do |c|
      category = Category.find_or_create_by(name: c)
      @product.categories << category
    end
    redirect_to products_path
  end
  ###################################3
  def update
    @product = Product.find_by_id(params[:id])
    authorize @product
     if @product.update(product_params)
       redirect_to product_path
      else
      render 'edit'
    end
  end
  def destroy
    @product = Product.find_by_id(params[:id])
    authorize @product
    @product.destroy
    redirect_to products_path

  end
  #############################
  def show
    @product = Product.find_by_id(params[:id])
    # @category = Category.find_or_create_by(name: params[:category_name])

  end
  ##########################
  private
    def product_params
      params.require(:product).permit(:name, :price, :description, :image, :category)
    end
    def categoty_params
      params.require(:category).permit(:name)
    end

end
