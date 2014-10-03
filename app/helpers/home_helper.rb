module HomeHelper
  def parse_file(filename)
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
        result << current_sale
      end
      i+=1
    end  
    rescue
      nil
    end
    result
  end
end
