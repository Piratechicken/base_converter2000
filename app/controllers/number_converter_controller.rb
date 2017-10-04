class NumberConverterController < ApplicationController

  def index
    safe_params = params.permit(:number, :base_from, :base_to)
    if !safe_params.empty? 
      @number = safe_params[:number].to_i
      @base_from = safe_params[:base_from].to_i
      @base_to = safe_params[:base_to].to_i
    end
  end

end
