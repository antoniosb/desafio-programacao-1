class HomeController < ApplicationController
  def index
  end

  #POST /upload_input_file
  def parse_input_file
    results = []
    file_param = params[:input_file]
    results = SalesSummary.parse_file(file_param.original_filename) unless file_param.nil?
    @revenue = SalesSummary.summarize_revenue results
    respond_to do |format|
      if results.empty?
        @message ||= "Error while parsing your file... sorry."
        format.js { render('error.js') }
        format.html { redirect_to(root_url, :notice => @message) }
      else
        @message ||= "File successfully parsed! The total of gross revenue is #{@revenue}"
        format.js { render('success.js') }
        format.html { redirect_to(root_url, :notice => @message) }
      end
    end
  end
end
