class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @comment = Comment.new
    @comments = Comment.all.order("created_at DESC")
  end

  def new
    @products = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    product = Product.new(product_params)
    puts "*************************"
    puts product.inspect 
    if product.valid?
      product.save
      flash[:success] = "Product has been saved in the database"
      redirect_to '/products'
    else
      flash[:errors] = product.errors.full_messages
      redirect_to '/products/new'
    end
  end

  def update
    puts params
    @product = Product.update(Product.find(params[:id]),product_params)
    
    puts @product 
    if @product.valid?

      flash[:success] = "Updated successfully in the system"
      redirect_to '/products'
    else
      flash[:errors] = @product.errors.full_messages
      puts @product.errors.full_messages
      redirect_to "/products/#{params[:id]}/edit"
    end
  end

  def destroy
    Product.destroy(params[:id])
    redirect_to '/products'
  end

  private
  def product_params
    params.require(:product).permit(:name,:description,:price,:category_id) 
  end
end
