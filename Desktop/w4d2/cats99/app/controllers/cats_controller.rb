class CatsController < ApplicationController
  
  def index
    @cats = Cat.all
    render :index
  end
  
  def show
    @cat = Cat.find(params[:id])
    if @cat
      render :show
    else
       render json: @cat.errors.full_messages, status: :unprocessable_entity
     end
  end
  
  def new
    @cat = Cat.new
    render :new
  end
  
  def create
    @cat = Cat.create(cat_params)
    render :show
  end
  
  def edit
    @cat = Cat.find(params[:id])
    if @cat
      render :edit
    else
      render json: @cat.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def update
    @cat = Cat.find(params[:id])
    if @cat.update(cat_params)
      redirect_to cat_url(@cat)
    else
      render json: @cat.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  
  private
  def cat_params
    params.require(:cat).permit(:name, :birth_date, :sex, :description, :color)
  end
end