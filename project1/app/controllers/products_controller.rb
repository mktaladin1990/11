class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    # @cate = Category.find_by_id(1).products
    @cate = Category.all
    # @makers = Lable.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @cate = Category.find_or_create_by(id: params[:product][:category_ids])
    respond_to do |format|
      if @product.save
        # @product.categories << @cate
        @product.labels.find_or_create_by(category_id: @cate.id)
        format.html { redirect_to products_path, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @product = Product.find_by_id(params[:id]) # tìm @product theo id product
    @cate = Category.find_by_id(params[:product]["category_ids"])  # tìm @cate theo id product.cate , nghĩa là trong product đó có id cate
    @labels = @product.labels.first # tìm @maker trong bảng trung gian có id product , lấy cái đầu tiên
    respond_to do |format|
      if @product.update(product_params)
        @labels.update_attributes(category_id: @cate.id )
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :image)
    end
end
