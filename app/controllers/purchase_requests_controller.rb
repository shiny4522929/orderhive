class PurchaseRequestsController < ApplicationController

  def index
    @purchase_request = PurchaseRequest.all
  end

  def create
    @purchase_request = PurchaseRequest.new(purchase_request_params)

    if @purchase_request.save
      redirect_to @purchase_request
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @purchase_request = PurchaseRequest.find(params[:id])
    @purchase_request.destroy

    redirect_to root_path, status: :see_other
  end

  def new
    @purchase_request  = PurchaseRequest.new
  end

  def edit
    @purchase_request = PurchaseRequest.find(params[:id])
    # if @purchase_request.update(purchase_request_params)
    #   redirect_to @purchase_request
    # else
    #   render :edit, status: :unprocessable_entity
    # end

  end

  def show
    @purchase_request = PurchaseRequest.find(params[:id])
  end
  private

  def purchase_request_params
    params.require(:purchase_request).permit(
      :delivery_date,
      :user_id,
      :requisition_amount,
      :pr_creation_date,
      :status,
      :approved
      )
  end
end
