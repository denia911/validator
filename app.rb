require_relative 'user'

user = User.new

user.name = "fgj"
user.number = '3'
user.type = "User"
user.details = { address: '123 Street' }

puts user.valid?
puts user.valid!
