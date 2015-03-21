class VarietalsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only
  before_action :set_varietal, only: [:show, :edit, :update, :destroy]

  # GET /varietals
  # GET /varietals.json
  def index
    @varietals = Varietal.all
    @wine_types = WineType.all
  end

  # GET /varietals/1
  # GET /varietals/1.json
  def show
  end

  # GET /varietals/new
  def new
    @varietal = Varietal.new
    @wine_types = WineType.all
  end

  # GET /varietals/1/edit
  def edit
    @wine_types = WineType.all
  end

  # POST /varietals
  # POST /varietals.json
  def create
    @varietal = Varietal.new(varietal_params)
    @wine_types = WineType.all

    respond_to do |format|
      if @varietal.save
        format.html { redirect_to @varietal, notice: 'Varietal was successfully created.' }
        format.json { render :show, status: :created, location: @varietal }
      else
        format.html { render :new }
        format.json { render json: @varietal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /varietals/1
  # PATCH/PUT /varietals/1.json
  def update
    @wine_types = WineType.all

    respond_to do |format|
      if @varietal.update(varietal_params)
        format.html { redirect_to @varietal, notice: 'Varietal was successfully updated.' }
        format.json { render :show, status: :ok, location: @varietal }
      else
        format.html { render :edit }
        format.json { render json: @varietal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /varietals/1
  # DELETE /varietals/1.json
  def destroy
    @varietal.destroy
    respond_to do |format|
      format.html { redirect_to varietals_url, notice: 'Varietal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def admin_only
    unless current_user.admin?
      redirect_to root_path, :alert => "Access denied."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_varietal
      @varietal = Varietal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def varietal_params
      params.require(:varietal).permit(:api_id, :varietal, :wine_type_id)
    end
end
