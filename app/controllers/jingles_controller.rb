class JinglesController < ApplicationController
  before_action :set_jingle, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /jingles
  # GET /jingles.json
  def index
    @jingles = Jingle.all
  end

  # GET /jingles/1
  # GET /jingles/1.json
  def show
  end

  # GET /jingles/new
  def new
    @jingle = Jingle.new
  end

  # GET /jingles/1/edit
  def edit
  end

  # POST /jingles
  # POST /jingles.json
  def create
    @jingle = current_user.build(jingle_params)

    respond_to do |format|
      if @jingle.save
        format.html { redirect_to @jingle, notice: 'Jingle was successfully created.' }
        format.json { render :show, status: :created, location: @jingle }
      else
        format.html { render :new }
        format.json { render json: @jingle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jingles/1
  # PATCH/PUT /jingles/1.json
  def update
    respond_to do |format|
      if @jingle.update(jingle_params)
        format.html { redirect_to @jingle, notice: 'Jingle was successfully updated.' }
        format.json { render :show, status: :ok, location: @jingle }
      else
        format.html { render :edit }
        format.json { render json: @jingle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jingles/1
  # DELETE /jingles/1.json
  def destroy
    @jingle.destroy
    respond_to do |format|
      format.html { redirect_to jingles_url, notice: 'Jingle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jingle
      @jingle = Jingle.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jingle_params
      params.require(:jingle).permit(:title, :audio)
    end
end
