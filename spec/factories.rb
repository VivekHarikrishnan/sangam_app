FactoryGirl.define do
  factory :user, class: User do
    name "Vivek"
    father_name  "Ramalingam"
    mother_name "Malliga"
    address "4/778, Thiruppattur POST, Mannachanallur TALUK, Trichy DISTRICT, Pincode-621105"
    date_of_birth "13-03-1989"
    date_of_join "01-05-2011"
  end
end