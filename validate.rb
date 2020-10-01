module Validate
  require_relative 'instance_methods'
  require_relative 'class_methods'

  def self.included(base)
    base.send(:include, InstanceMethods)
    base.extend(ClassMethods)
  end
end
