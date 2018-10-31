class ActionEffect < ApplicationRecord
  belongs_to :story_action
  belongs_to :predicate_definition
  has_many :action_inputs, as: :action_inputable

  def name
    "(#{predicate_definition.name} #{action_inputs.map{ |ai| ai.name }.join(", ")})"
  end
end
