module ClassMethods
  def validates(*args)
    create_validation(args)
  end

  def validators
    @validators
  end

  private

  def create_validation(args)
    @validators = [] unless defined?(@validators)
    @validators << args
  end
end
