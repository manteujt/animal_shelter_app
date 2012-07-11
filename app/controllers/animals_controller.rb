class AnimalsController < ApplicationController
  def new
  end
  
  def show
    @animal = Animal.find(params[:id])
  end
  
  def index
    @animals = Animal.send(params[:display]) if Animal.respond_to?(params[:display])
  end
end
