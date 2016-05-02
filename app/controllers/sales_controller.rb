class SalesController < ApplicationController

  def show
    # sale is not an instance variable as it is not used elsewhere (no views (yet))
    sale = Sale.find params[:id]
    render json: { data: sale }
  end

  def create
    if valid_password?(params[:hashed_password])
      begin
        sales = permitted_sale_params.collect{|sale| Sale.create!(sale)}
        # render json: { data: sales }, status: :created
        render json: { data: sales }, methods: [:date, :time], status: :created
      rescue
        render json: { data: sales }, status: :bad_request
      end
    else
      render json: {error: "Not Authorized"}, status: 403
    end
  end

  private

  def permitted_sale_params
    params.permit(sales: [:date, :time, :code, :value]).require(:sales)
  end

  def valid_password?(hashed_password)
    # TODO: In Progress
    hashed_password == 'correct'
  end

  # def sale_params
  #   params.require(:sale).permit(:date, time ...)
  # end

end
