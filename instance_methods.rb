module InstanceMethods
  require_relative 'validation_errors'
  attr_reader :object, :errors

  def initialize(object)
    @object = object
    @errors = ValidationErrors.new
  end

  def valid?
    self.class.validators.each { |args| validate(args) }
    @errors.all.empty?
  end

  private

  def validate(args)
    case
    when args[1].key?(:with)
      with_validator(*args)
    when args[1].key?(:type)
      type_validator(*args)
    end
  end

  def with_validator(name, options)
    fail unless options[:with].call(@object)
  rescue
    @errors.add(name, options[:msg])
  end

  def type_validator(name, options)
    return if @object.send(name).is_a?(options[:type])
    @errors.add(name, "must be a #{options[:type].name}")
  end
end
