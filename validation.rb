module Validation
  require_relative 'user_validator'

  def valid?
    klass = Object.const_get("#{self.class.name}Validator")
    @validator = klass.new(self)
    @validator.valid?
  end

  def valid!
    return {} unless defined?(@validator)
    @validator.errors.full_messages
  end
end
