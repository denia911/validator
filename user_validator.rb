class UserValidator
  require_relative 'validate'
  include ::Validate

  validates :name,
            msg: 'must be present.',
              with: proc { |p| (!p.name.strip.empty? && !p.name.nil?) }
  validates :number,
            msg: 'is not a valid format.',
            with: proc { |p| p.number =~ /[A-Z0-3]/ }
  validates :type,
            msg: 'must be greater than 0.',
            with: proc { |p| p.type == p.class.name }
  validates :details, type: Hash
end
