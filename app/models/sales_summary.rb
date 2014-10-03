class SalesSummary < ActiveRecord::Base

  validates :purchaser_name, :item_description, :merchant_address, :merchant_name, presence: true
  validates :item_price, presence: true, numericality: true
  validates :purchase_count, presence: true, numericality: { only_integer: true }


  def self.parse_file(filename)
    result = []
    begin
    headers = open(filename, &:readline).split(/\t/).map(&:strip)
    i=0
    open(filename).each_line do |f|
      unless i==0 
        current_data = f.split(/\t/).map(&:strip)
        current_sale = SalesSummary.new
        headers.each_with_index do |attribute, i|
          current_sale.send("#{attribute.tr(' ','_')}=",current_data[i])
        end
        result << current_sale if current_sale.save
      end
      i+=1
    end  
    rescue
      nil
    end
    result
  end

  def self.summarize_revenue(param)
    param.inject(0) { |total, curr| total + (curr.item_price * curr.purchase_count) }
  end

end
