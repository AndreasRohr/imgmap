class ImagesController < ApplicationController
  before_action :set_image, only: %i[ show edit update destroy ]

  # GET /images or /images.json
  def index
    @images = Image.all
  end

  # GET /images/1 or /images/1.json
  def show
    @image = Image.find_by(id: params[:id])
    redirect_to images_path, notice: "Image not found." if !@image
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images or /images.json


  def create
    if params[:image][:source].present?
      params[:image][:source].each do |file|
        if file.is_a?(ActionDispatch::Http::UploadedFile)
          @image = Image.new(image_params)
          @image.source = file
          @image.save
        end
      end
      redirect_to images_path, notice: "Images were successfully uploaded."
    else
      redirect_to new_image_path, alert: "Please select at least one file to upload."
    end
  end




  # def create
  #   @image = Image.new(image_params)
  #
  #   respond_to do |format|
  #     if @image.save
  #       format.html { redirect_to image_url(@image), notice: "Image was successfully created." }
  #       format.json { render :show, status: :created, location: @image }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @image.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /images/1 or /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to image_url(@image), notice: "Image was successfully updated." }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1 or /images/1.json
  def destroy
    @image.destroy

    respond_to do |format|
      format.html { redirect_to images_url, notice: "Image was successfully destroyed." }
      format.json { head :no_content }
    end
  end



  private
  # Use callbacks to share common setup or constraints between actions.
  def set_image
    @image = Image.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def image_params
    params.require(:image).permit(:title, :lat, :lng, :rotation, :tag, :date, :uploadedBy, :image_set_id, :source =>[])
  end
end
