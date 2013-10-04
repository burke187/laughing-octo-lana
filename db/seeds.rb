require 'faker'
10.times do 
  Task.create(:name => Faker::Company.bs)
end
