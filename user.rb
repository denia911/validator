class User
  require_relative 'validation'
  include Validation

  attr_accessor :name, :number, :type, :details
end
