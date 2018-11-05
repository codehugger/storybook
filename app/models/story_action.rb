class StoryAction < ApplicationRecord
  belongs_to :story
  has_many :action_parameters
  has_many :action_preconditions
  has_many :action_effects
  has_many :action_agents

  def pddl
    %{
(:action #{name}
  :parameters (#{action_parameters.join(" ")})
  :precondition #{action_preconditions.count > 1 ?
                "(and #{action_preconditions.join(" ")})" :
                "#{action_preconditions.join(" ")}"}
  :effect #{action_effects.count > 1 ?
          "(and #{action_effects.join(" ")})" :
          "#{action_effects.join(" ")}"}
  :agents (#{action_agents.join(" ")}))}
  end

  RailsAdmin.config do |config|
    config.model StoryAction do
      show do
        field :pddl do
          pretty_value do
            story_action = bindings[:object]
            %{<pre>#{story_action.pddl}</pre>}.html_safe
          end
        end
        field :story
        field :action_preconditions
        field :action_parameters
        field :action_effects
        field :action_agents
      end
    end
  end
end
