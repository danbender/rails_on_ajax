# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :menu_item do
    name "MyString"
    description "MyText"
    price 1.5
    menu nil
  end
end
