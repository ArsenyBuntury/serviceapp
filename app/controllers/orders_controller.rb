class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
  before_action :fetch_services, only: %i[new edit]
  before_action :fetch_staffs, only: %i[new edit]
  before_action :fetch_categories, only: %i[new edit]

  # GET /orders or /orders.json
  def index
       @orders = Order.all
       
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def sort(date)
    ##@date = date
    ##@orders.each do |order|
     ## order.find_by(:date)
    ##end
    Order.find_by_date(date)
  end

  def export_to_excel
    @orders = Order.all
      respond_to do |format|
        format.html
        format.xlsx {
          render xlsx: 'orders', template: 'view/orders/orders'
            }
    end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:name, :date, service_ids: [], staff_ids: [], category_ids: [])
    end

    def fetch_services
      @services = Service.all
    end

    def fetch_staffs
      @staffs = Staff.all
    end

    def fetch_categories
      @categories = Category.all
    end

    helper_method :sort
   
  
end
