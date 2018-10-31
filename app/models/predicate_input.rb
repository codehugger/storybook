class PredicateInput < ApplicationRecord
  belongs_to :predicate_definition
  belongs_to :parameter_type

  def name
    "?#{super} - #{parameter_type}"
  end

  def pddl
    name
  end
end
