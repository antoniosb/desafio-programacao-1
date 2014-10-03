# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sales_summary do
    purchaser_name 'Wonkie'
    item_description 'Umpa Lumpa'
    merchant_address '000 Wonderland St'
    merchant_name 'Willie'
    item_price 7.89
    purchase_count 7
  end
end
