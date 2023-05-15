class PurchaseRequestsController < ApplicationController

  def index
    @purchase_requests = PurchaseRequest.all
  end

  def create
    @user = User.find_by(id: params[:user_id])
    @purchase_request = @user.purchase_requests.new(purchase_request_params)
    respond_to do |format|
      if @purchase_request.save
        format.html { redirect_to user_purchase_request_path(@user, @purchase_request), notice: 'Shipment was successfully created.' }
        format.json { render :show, status: :created, location: @purchase_request }
      else
        format.html { render :new }
        format.json { render json: @purchase_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @user = User.find_by(id: params[:user_id])
    @purchase_request = PurchaseRequest.find(params[:id])
  end 

  def destroy

    @user = User.find_by(id: params[:user_id])
    @purchase_request = PurchaseRequest.find(params[:id])
    @purchase_request.destroy
    respond_to do |format|
      format.html { redirect_to user_purchase_requests_path(@user, @purchase_request), notice: 'Load was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def new
    @purchase_request  = PurchaseRequest.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @user = User.find_by(id: params[:user_id])
    @purchase_request = PurchaseRequest.find(params[:id])
    respond_to do |format|
      if @purchase_request.update(purchase_request_params)
        format.html { redirect_to user_purchase_request_path(@user, @purchase_request), notice: 'Load was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase_request }
      else
        format.html { render :edit }
        format.json { render json: @purchase_request.errors, status: :unprocessable_entity }
      end
     end
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @purchase_request = PurchaseRequest.find(params[:id])
    respond_to do |format|
      format.js  
      format.html
    end
  end
   
  private

  def purchase_request_params
    params.require(:purchase_request).permit(:delivery_date, :user_id, :requisition_amount, :pr_creation_date, :status, :approved)
  end
end
