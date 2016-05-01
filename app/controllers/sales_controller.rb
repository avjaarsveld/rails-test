class SalesController < ApplicationController

  def show
    render json: { data: {foo: :bar} }
  end

end
