class SlidesController < ApplicationController
  before_action :set_slide, only: [:show, :edit, :update, :destroy]
  before_filter :verify_is_admin, only: [:new, :edit, :update, :destroy, :show, :index]

  # GET /slides
  # GET /slides.json
  def index
    @slides = Slide.all
  end

  # GET /slides/1
  # GET /slides/1.json
  def show
  end

  # GET /slides/new
  def new
    @slide = Slide.new
  end

  # GET /slides/1/edit
  def edit
    @slide = Slide.find(params[:id])
  end

  # POST /slides
  # POST /slides.json
  def create
    @slide = Slide.new(slide_params)

    respond_to do |format|
      if @slide.save
        format.html { redirect_to @slide, notice: 'Slide was successfully created.' }
        format.json { render :show, status: :created, location: @slide }
      else
        format.html { render :new }
        format.json { render json: @slide.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /slides/1
  # PATCH/PUT /slides/1.json
  def update
    respond_to do |format|
      if @slide.update(slide_params)
        format.html { redirect_to @slide, notice: 'Slide was successfully updated.' }
        format.json { render :show, status: :ok, location: @slide }
      else
        format.html { render :edit }
        format.json { render json: @slide.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slides/1
  # DELETE /slides/1.json
  def destroy
    @slide.destroy
    respond_to do |format|
      format.html { redirect_to slides_url, notice: 'Slide was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slide
      @slide = Slide.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:title, :description, :price, :length, :weight, :name, :image, :constant_price, :price_per_size, :price_per_length, :category, :base_price_one, :base_price_oneofive, :base_price_two, :base_price_twofive, :base_price_three, :base_price_threefive, :base_price_four,:additional_foot_price)
    end

    def verify_is_admin
      (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def slide_params
      params.require(:slide).permit(:title, :product_type, :image)
    end
end
