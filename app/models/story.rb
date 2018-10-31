class Story < ApplicationRecord
  has_many :predicate_definitions
  has_many :story_actions

  def pddl
    %{
(define (domain #{name})
  (:requirements :adl :domain-axioms :intentionality)
  (:types #{ParameterType.all.collect(&:name).join(" ")} - object)
  (:predicates #{predicate_definitions.all.collect(&:pddl).join(" ")})
  #{story_actions.all.collect(&:pddl).join(" ")})}
  end

  RailsAdmin.config do |config|
    config.model Story do
      show do
        field :pddl do
          pretty_value do
            story_action = bindings[:object]
            %{<pre>#{story_action.pddl}</pre>}.html_safe
          end
        end
        field :name
        field :story_actions
      end
    end
  end
end
