class ActionAgent < ApplicationRecord
  belongs_to :story_action
  belongs_to :action_parameter

  def name
    "?#{action_parameter.name}"
  end
end
