class DealsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[show destroy]

  # GET /deals or /deals.json
  def index
    @category = Category.find(params[:category_id])
    @deals = Deal.where(category_id: @category.id).order(created_at: :desc)
  end

  # GET /deals/new
  def new
    @deal = Deal.new
  end

  # POST /deals or /deals.json
  def create
    @category = Category.find(params[:category_id])
    new_deal_params = deal_params.merge(user_id: current_user.id, category_id: @category.id)
    @deal = Deal.new(new_deal_params)

    respond_to do |format|
      if @deal.save
        format.html { redirect_to category_deals_url, notice: 'Deal was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deals/1 or /deals/1.json
  def destroy
    @deal.destroy
    respond_to do |format|
      format.html { redirect_to category_deals_url(@deal.category_id), notice: 'Deal was successfully destroyed.' }
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def deal_params
    params.require(:deal).permit(:name, :amount)
  end
end
