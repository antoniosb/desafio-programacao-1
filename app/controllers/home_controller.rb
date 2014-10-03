class HomeController < ApplicationController
  def index
  end

  #POST /upload_input_file
  def parse_input_file
    results = SalesSummary.parse_file(params[:input_file].original_filename)
    
    revenue = SalesSummary.summarize_revenue results
    
    if results.empty?  
      redirect_to root_path, flash: { error: "Error while parsing your, file... sorry." }
    else
      redirect_to root_path, flash: { notice: "File successfully parsed! Thank you." }
    end
  end
end
