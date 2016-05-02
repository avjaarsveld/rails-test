class SalesController < ApplicationController

  def show
    # sale is not an instance variable as it is not used elsewhere (no views (yet))
    sale = Sale.find_with_password params[:id], params[:password]
    if sale
      render json: { data: sale }, status: :created
    else
      # TODO: staus: 403 if sale with id exists but password does not match
      render json: { error: "Not found" }, status: :not_found #404
    end
  end

  def create
    begin
      sales = permitted_sale_params.collect do |sale|
        Sale.create!(sale.merge! password: permitted_password_param)
      end
      render json: { data: sales }, methods: [:date, :time], status: :created
    rescue
      render json: { error: "Bad request" }, status: :bad_request #400
    end
  end

  def destroy
    Sale.find(params[:id]).destroy
    head :no_content
  end

  private

  def permitted_sale_params
    permitted_params.require(:sales)
  end

  def permitted_password_param
    permitted_params.require(:password)
  end

  def permitted_params
    params.permit(:password, sales: [:date, :time, :code, :value])
  end

end
