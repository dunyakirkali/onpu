class Users::JinglesController < ApplicationController
  before_action :set_jingle, only: [:buy, :show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @jingles = current_user.jingles.includes(:user)
  end

  def show
  end

  def new
    @jingle = current_user.jingles.build
  end

  def edit
  end

  def create
    @jingle = current_user.jingles.build(jingle_params)
    if @jingle.save
      redirect_to users_jingle_path(@jingle), notice: 'Jingle was successfully created.'
    else
      render :new
    end
  end

  def update
    if @jingle.update(jingle_params)
      redirect_to users_jingle_path(@jingle), notice: 'Jingle was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @jingle.destroy
    redirect_to users_jingles_path, notice: 'Jingle was successfully destroyed.'
  end

  private

  def set_jingle
    @jingle = current_user.friendly.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def jingle_params
    params.require(:jingle).permit(:title, :audio)
  end
end
