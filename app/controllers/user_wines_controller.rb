class UserWinesController < ApplicationController
  before_action :set_user_wine, only: [:show, :edit, :update, :destroy]

  # GET /user_wines
  # GET /user_wines.json
  def index
    @user_wines = UserWine.all
  end

  # GET /user_wines/1
  # GET /user_wines/1.json
  def show
  end

  # GET /user_wines/new
  def new
    @user_wine = UserWine.new
  end

  # GET /user_wines/1/edit
  def edit
  end

  # POST /user_wines
  # POST /user_wines.json
  def create
    @user_wine = UserWine.new(user_wine_params)

    respond_to do |format|
      if @user_wine.save
        format.html { redirect_to @user_wine, notice: 'User wine was successfully created.' }
        format.json { render :show, status: :created, location: @user_wine }
      else
        format.html { render :new }
        format.json { render json: @user_wine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_wines/1
  # PATCH/PUT /user_wines/1.json
  def update
    respond_to do |format|
      if @user_wine.update(user_wine_params)
        format.html { redirect_to @user_wine, notice: 'User wine was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_wine }
      else
        format.html { render :edit }
        format.json { render json: @user_wine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_wines/1
  # DELETE /user_wines/1.json
  def destroy
    @user_wine.destroy
    respond_to do |format|
      format.html { redirect_to user_wines_url, notice: 'User wine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_wine
      @user_wine = UserWine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_wine_params
      params.require(:user_wine).permit(:user_id, :wine_id, :stage_id, :rating, :review)
    end
end
