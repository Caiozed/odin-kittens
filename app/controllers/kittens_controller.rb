class KittensController < ApplicationController
  def index
  	@kittens = Kitten.all
  	respond_to do |format|
  		format.html
  		format.json {render json: @kittens}
  	end
  end

  def new
  	@kitten = Kitten.new
  end

  def create
  	@kitten = Kitten.new(kitten_params)
  	if @kitten.save
  		flash[:success] = "Yay new kittie!"
  		redirect_to @kitten
  	else
  		flash[:danger] = "Do you even create bro?"
  		flash.now  
  		render :new
  	end
  end

  def edit
  	@kitten = Kitten.find(params[:id])
  end

  def update
  	@kitten = Kitten.find(params[:id])
  	if @kitten.update(kitten_params)
  		flash[:success] = "Kittie updated!"
  		redirect_to @kitten
  	else
  		flash[:danger] = "Error on updating LOL!"
  		flash.now  
  		render :edit
  	end
  end

  def show
  	@kitten = Kitten.find(params[:id])
  	respond_to do |format|
  		format.html
  		format.json {render json: @kitten }
  	end
  end

  def destroy 
  	@kitten = Kitten.find(params[:id])
  	@kitten.destroy
  	flash[:success] = "Kittie has gone to its home planet!"
  	redirect_to root_path
  end

  def kitten_params
  	params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
