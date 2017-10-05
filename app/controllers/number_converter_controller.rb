class NumberConverterController < ApplicationController

  def index
    safe_params = params.permit(:number, :base)
    @number_conversion = NumberConversion.new(safe_params)
    @number_conversion.save if request.post?

    # if !safe_params.empty? 
    #   number = safe_params[:number].to_i
    #   base_from = safe_params[:base_from]
    #   base_to = safe_params[:base_to]
    #   @number_conversion = NumberConversion.new(number: number, base: base_to)
    #   @number_conversion.save
    # else

    # end

    @past_conversions = NumberConversion.all.order(created_at: :desc)
  end

end
