class CheckoutsController < ApplicationController
  before_action :set_checkout, only: [:show, :edit, :update, :destroy]
  before_filter :verify_is_admin, only: [:edit, :update, :destroy, :index]


  # GET /checkouts
  # GET /checkouts.json
  def index
    @checkouts = Checkout.all
  end

  # GET /checkouts/1
  # GET /checkouts/1.json
  def show
  end

  # GET /checkouts/new
  def new
    @checkout = Checkout.new
  end

  # GET /checkouts/1/edit
  def edit
  end

  # POST /checkouts
  # POST /checkouts.json
  def create
    @checkout = Checkout.new(checkout_params)
    order = Order.find(@checkout.order_id)

    respond_to do |format|
      if @checkout.save
        # send email
         OrderSubmissionMailer.ordersumit(@checkout, order).deliver
         session.delete(:order_id)
        format.html { redirect_to products_path, notice: 'Your order was successfully submitted. You will hear from us within the hour' }
        format.json { render :show, status: :created, location: @checkout }
      else
        format.html { render :new }
        format.json { render json: @checkout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checkouts/1
  # PATCH/PUT /checkouts/1.json
  def update
    respond_to do |format|
      if @checkout.update(checkout_params)
        format.html { }
        format.json { render :show, status: :ok, location: @checkout }
      else
        format.html { render :edit }
        format.json { render json: @checkout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checkouts/1
  # DELETE /checkouts/1.json
  def destroy
    @checkout.destroy
    respond_to do |format|
      format.html { redirect_to checkouts_url, notice: 'Checkout was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checkout
      @checkout = Checkout.find(params[:id])
    end
    def verify_is_admin
      (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def checkout_params
      params.require(:checkout).permit(:email, :string, :phone_number, :string, :order_id, :credit_card_number, :security_code, :expiration_date)
    end
end
