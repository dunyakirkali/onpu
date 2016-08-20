class Users::JinglesController < ApplicationController
  before_action :set_jingle, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /jingles
  # GET /jingles.json
  def index
    @jingles = Jingle.all.includes(:user)
  end

  # GET /jingles/1
  # GET /jingles/1.json
  def show
  end

  # GET /jingles/new
  def new
    @jingle = current_user.jingles.build
  end

  # GET /jingles/1/edit
  def edit
  end

  # POST /jingles
  # POST /jingles.json
  def create
    @jingle = current_user.jingles.build(jingle_params)
    if @jingle.save
      redirect_to users_jingle_path(@jingle), notice: 'Jingle was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /jingles/1
  # PATCH/PUT /jingles/1.json
  def update
    if @jingle.update(jingle_params)
      redirect_to users_jingle_path(@jingle), notice: 'Jingle was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /jingles/1
  # DELETE /jingles/1.json
  def destroy
    @jingle.destroy
    redirect_to users_jingles_path, notice: 'Jingle was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_jingle
    @jingle = current_user.jingles.friendly.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def jingle_params
    params.require(:jingle).permit(:title, :audio)
  end
end
