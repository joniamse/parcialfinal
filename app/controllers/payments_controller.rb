class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  load_and_authorize_resource 
  helper_method :sort_column, :sort_direction
  # GET /payments or /payments.json
  def index

    if params[:from].blank? and params[:to].blank? and params[:person].blank? and params[:car].blank? and params[:cabin].blank?
      @payments = Payment.all.paginate(:page => params[:page], :per_page => 50)
      @payments = Payment.order(sort_column + ' ' + sort_direction).paginate(:page => params[:page], :per_page => 50)

    elsif params[:from] and params[:to]
      @payments = Payment.filterfromto(params[:from], params[:to]).paginate(:page => params[:page], :per_page => 50)

    elsif params[:person] and params[:car]   #FILTRA POR PERSON Y CAR JUNTOS
      @payments = Payment.filterambos(params[:person], params[:car]).paginate(:page => params[:page], :per_page => 50)

    elsif params[:cabin]  #FILTRA POR CABIN
      @payments = Payment.filtercabin(params[:cabin]).paginate(:page => params[:page], :per_page => 50)  
    end

    @totalprice = Payment.totalprice   
  end

  
  def sort_column
    Payment.column_names.include?(params[:sort]) ? params[:sort] : "import"
    Payment.column_names.include?(params[:sort]) ? params[:sort] : "bill_date"

  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end


  # GET /payments/1 or /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    @payment = Payment.new
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments or /payments.json
  def create
    @payment = Payment.new(payment_params)

    respond_to do |format|
      if @payment.save
        format.html { redirect_to @payment, notice: "Payment was successfully created." }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payments/1 or /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to @payment, notice: "Payment was successfully updated." }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1 or /payments/1.json
  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to payments_url, notice: "Payment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def payment_params
      params.require(:payment).permit(:import, :return, :bill_date, :person_id, :rate_id)
    end
end
