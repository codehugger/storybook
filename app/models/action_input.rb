class ActionInput < ApplicationRecord
  belongs_to :action_inputable, polymorphic: true
  belongs_to :predicate_input
  belongs_to :action_parameter

  def name
    "#{action_parameter.name}"
  end
end
