class ImageSetsController < ApplicationController
  before_action :set_image_set, only: %i[ show edit update destroy ]

  # GET /image_sets or /image_sets.json
  def index
    @image_sets = ImageSet.includes(:map).all
  end

  # GET /image_sets/1 or /image_sets/1.json
  def show
  end

  # GET /image_sets/new
  def new
    @image_set = ImageSet.new
  end

  # GET /image_sets/1/edit
  def edit
  end

  # POST /image_sets or /image_sets.json
  def create
    @image_set = ImageSet.new(image_set_params)

    respond_to do |format|
      if @image_set.save
        format.html { redirect_to image_set_url(@image_set), notice: "Image set was successfully created." }
        format.json { render :show, status: :created, location: @image_set }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @image_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /image_sets/1 or /image_sets/1.json
  def update
    respond_to do |format|
      if @image_set.update(image_set_params)
        format.html { redirect_to image_set_url(@image_set), notice: "Image set was successfully updated." }
        format.json { render :show, status: :ok, location: @image_set }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @image_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /image_sets/1 or /image_sets/1.json
  def destroy
    @image_set.destroy

    respond_to do |format|
      format.html { redirect_to image_sets_url, notice: "Image set was successfully destroyed." }
      format.json { head :no_content }
    end
  end



  private
  # Use callbacks to share common setup or constraints between actions.
  def set_image_set
    @image_set = ImageSet.includes(:map).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def image_set_params
    params.require(:image_set).permit(:title, :typ, :color, :map_id)
  end
end
