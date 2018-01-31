class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]

  def index
    @attractions = Attraction.all
  end

  def show
    @ride = Ride.new
  end

  def new
    @attraction = Attraction.new
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])
  end

  def create
    @attraction = Attraction.create(attraction_params)
    if @attraction.valid?
      @attraction.save
      redirect_to attraction_path(@attraction), notice: "A new attraction has been successfully made."
    else
      render :new
    end
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    if @attraction.save
      redirect_to @attraction, notice: "Attraction was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @attraction.destroy
    redirect_to attractions_url, notice: "Attraction was successfully destroyed."
  end

  private

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
  end

end
