class PredicateDefinition < ApplicationRecord
  belongs_to :story
  has_many :predicate_inputs

  def to_s
    "#{name} #{predicate_inputs.map { |pi| pi.name }}"
  end

  def pddl
    "(#{name} #{predicate_inputs.collect(&:pddl).join(" ")})"
  end
end
