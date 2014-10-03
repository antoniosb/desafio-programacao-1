require 'spec_helper'

describe SalesSummary do
  context 'validations' do
    it { should validate_presence_of :purchaser_name }
    it { should validate_presence_of :item_description }
    it { should validate_presence_of :merchant_address }
    it { should validate_presence_of :merchant_name }
    it { should validate_presence_of :item_price }
    it { should validate_presence_of :purchase_count }
    it { should_not allow_value(1.0).for:purchase_count }
    it { should allow_value(1).for :purchase_count }
    it { should allow_value(1.0).for :item_price }
    it { should allow_value(1).for :item_price }
  end

  context 'business logic' do
    context '#parse_file' do
      it 'should parse a valid format input file' do
        SalesSummary.parse_file('example_input.tab').each do |r|
            expect(r).to be_valid
        end
      end

      it 'should not parse invalid format input file' do
          expect(SalesSummary.parse_file('example_input_error.tab')).to be_empty
      end

      it 'should not parse files with invalid name' do
          expect(SalesSummary.parse_file('alice_on_the_wonderland.csv')).to be_empty
      end 
    end

    context '#summarize_revenue' do
        it 'should return the sum of all sale sumaries' do
            param = []
            1.upto(5) do |i|
                curr = SalesSummary.new purchaser_name: 'Rabbit', item_description: 'clock', 
                merchant_address: 'Wonderland', merchant_name: 'that hat guy', 
                item_price: i*2, purchase_count: i
                param << curr
            end
            expect(SalesSummary.summarize_revenue(param)).to eq 2+8+18+32+50
        end

        it 'should return 0 for empty params' do
            param = []
            expect(SalesSummary.summarize_revenue(param)).to eq 0
        end
    end
  end
end
