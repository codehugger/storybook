class ActionParameter < ApplicationRecord
  belongs_to :story_action
  belongs_to :parameter_type

  def to_s
    "?#{super} - #{parameter_type}"
  end
end
