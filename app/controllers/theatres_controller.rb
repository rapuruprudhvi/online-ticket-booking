# app/controllers/theatres_controller.rb
class TheatresController < ApplicationController
  def index
    @theatres = Theatre.all
  end

  def show
    @theatre = Theatre.find(params[:id])
  end

  def new
    @theatre = Theatre.new
  end

  def create
    @theatre = Theatre.new(theatre_params)
    if @theatre.save
      redirect_to @theatre, notice: 'Theatre was successfully created.'
    else
      render :new
    end
  end

  private

  def theatre_params
    params.require(:theatre).permit(:name, :capacity)
  end
end
