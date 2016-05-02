class SalesController < ApplicationController

  # before_action :convert_params_date, only: [:create]

  def show
    # sale is not an instance variable as it is not used elsewhere (no views (yet))
    sale = Sale.find params[:id]
    render json: { data: sale }
  end

  def create
    if valid_password?(params[:hashed_password])
      begin
        sales = permitted_sale_params.collect{|sale| Sale.create!(sale)}
        render json: { data: sales }, status: :created
      rescue
        render json: { data: sales }, status: :bad_request
      end
    else
      render json: {error: "Not Authorized"}, status: 403
    end
  end

  private

  def permitted_sale_params
    params.permit(sales: [:datetime, :date, :time, :code, :value]).require(:sales)
  end

  # TODO This should be somewhere more sensible
  def convert_params_date
    params.require(:sales).collect do |sale_param|
      sale_param.merge!(
        datetime: "#{sale_param.delete(:date)} #{sale_param.delete(:time)}".to_datetime
      )
    end
  end

  def valid_password?(hashed_password)
    # TODO: In Progress
    hashed_password == 'correct'
  end

end
