class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # debug .rb
  p "*=*=*=*=DEBUG: " + File.expand_path(__FILE__) + ": controller*=*=*=*="

  # layout "product"

  # GET /products
  # GET /products.json
  def index
    
    if params[:q]
      search_term = params[:q]
      @products = Product.search(search_term)
    else
      @products = Product.all
    end


    render layout: "product"

    # debug .rb
    p "*=*=*=*=DEBUG: " + File.expand_path(__FILE__) + ": index*=*=*=*="
    
  end

  # GET /products/1
  # GET /products/1.json
  def show
    # debug .rb
    p "*=*=*=*=DEBUG: " + File.expand_path(__FILE__) + ": show*=*=*=*="
  end

  # GET /products/new
  def new
    @roduct = Product.new

    # debug .rb
    p "*=*=*=*=DEBUG: " + File.expand_path(__FILE__) + ": new*=*=*=*="

  end

  # GET /products/1/edit
  def edit

    # debug .rb
    p "*=*=*=*=DEBUG: " + File.expand_path(__FILE__) + ": edit*=*=*=*="

  end

  # POST /products
  # POST /products.json
  def create

    # debug .rb
    p "*=*=*=*=DEBUG: " + File.expand_path(__FILE__) + ": create*=*=*=*="

    @prdct = Product.new(product_params)

    respond_to do |format|
      if @prdct.save
        # format.html { redirect_to @prdct, notice: 'Product was successfully created.' }
        format.html { redirect_to products_path, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @prdct }
      else
        format.html { render :new }
        format.json { render json: @prdct.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update

    # debug .rb
    p "*=*=*=*=DEBUG: " + File.expand_path(__FILE__) + ": update*=*=*=*="

    respond_to do |format|
      if @produc.update(product_params)
        format.html { redirect_to @produc, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @produc }
      else
        format.html { render :edit }
        format.json { render json: @produc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy

    # debug .rb
    p "*=*=*=*=DEBUG: " + File.expand_path(__FILE__) + ": destroy*=*=*=*="

    @produc.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @produc = Product.find(params[:id])

     # debug .rb
     p "*=*=*=*=DEBUG: " + File.expand_path(__FILE__) + ": set_product*=*=*=*="

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params

     # debug .rb
      p "*=*=*=*=DEBUG: " + File.expand_path(__FILE__) + ": product_params*=*=*=*="

      params.require(:product).permit(:name, :description, :image_url, :color, :image_thumb)

    end
end
