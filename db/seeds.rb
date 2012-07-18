#'!' here means always raise an exception if action fails

User.create! do |user|
  user.full_name             = 'Dakota'
  user.email                 = 'dog@pants.com'
  user.password              = 'password'
  user.password_confirmation = 'password'

end

Category.create!(title: 'Business')
Category.create!(title: 'Politics')
Category.create!(title: 'Religion')
Category.create!(title: 'Science')
Category.create!(title: 'Love')
