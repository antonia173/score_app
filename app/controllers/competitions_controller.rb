class CompetitionsController < ApplicationController
  include MatchGenerator

  before_action :set_competition, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]


  # GET /competitions
  def index
    @competitions = Competition.all
  end

  # GET /competitions/:id
  def show
    @matches = @competition.matches.group_by(&:round)
    @standings = @competition.standings.order(points: :desc)
  end

  # GET /competitions/new
  def new
    @competition = Competition.new
  end

  # GET /competitions/:id/edit
  def edit
  end

  # POST /competitions
  def create
    @competition = Competition.new(competition_params.except(:competitors))
    if @competition.save
      create_competitors
      generate_matches(@competition, @competition.competitors.size)

      flash[:notice] = "Competition was created successfully."
      redirect_to @competition
    else
      render 'new'
    end
  end

  # PUT /competition/:id
  def update
    if @competition.update(article_params.except(:competitors))
      flash[:notice] = "Competition was updated successfully."
      redirect_to @competition
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /competition/:id
  def destroy
    @competition.destroy
    redirect_to root_path
  end

  private
  
  def set_competition
    @competition = Competition.find_by(id: params[:id])
  end

  def competition_params
    params.require(:competition).permit(:name, :win, :draw, :loss, :competitors)
  end

  def create_competitors
    competitors_names = competition_params[:competitors].split(';').map(&:strip)
    competitors_names.each do |name|
      @competition.competitors.create(name: name)
    end
  end
end