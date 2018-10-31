# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# OBJECT TYPES

character_type = ParameterType.create(name: "character")
item_type      = ParameterType.create(name: "item")
place_type     = ParameterType.create(name: "place")

# STORY

story = Story.create(name: "arthur-kingdom")

## STORY PREDICATES

# alive_predicate = story.predicate_definitions.create(name: "alive")
# alive_predicate.predicate_input.create(name: "character", parameter_type: character_type)

at_predicate       = story.predicate_definitions.create(name: "at")
at_character_input = at_predicate.predicate_inputs.create(name: "character",
  parameter_type: character_type)
at_place_input     = at_predicate.predicate_inputs.create(name: "place",
  parameter_type: place_type)

# claimed_predicate = story.predicate_definitions.create(name: "claimed")
# claimed_predicate.predicate_input.create(name: "character", parameter_type: character_type)
# claimed_predicate.predicate_input.create(name: "place", parameter_type: place_type)

# claimer_predicate  = story.predicate_definitions.create(name: "claimer")
# claimer_predicate.predicate_input.create(name: "item", parameter_type: item_type)

# claimable_predicate = story.predicate_definitions.create(name: "claimable")
# claimable_predicate.predicate_input.create(name: "place", parameter_type: place_type)

# has_predicate = story.predicate_definitions.create(name: "has")
# has_predicate.predicate_input.create(name: "character", parameter_type: character_type)
# has_predicate.predicate_input.create(name: "item", parameter_type: item_type)

# located_predicate = story.predicate_definitions.create(name: "located")
# located_predicate.predicate_input.create(name: "item", parameter_type: item_type)
# located_predicate.predicate_input.create(name: "place", parameter_type: place_type)

# ruined_predicate = story.predicate_definitions.create(name: "ruined")
# ruined_predicate.predicate_input.create(name: "place", parameter_type: place_type)

# weapon_predicate = story.predicate_definitions.create(name: "weapon")
# weapon_predicate.predicate_input.create(name: "item", parameter_type: item_type)

## ACTIONS

### TRAVEL

travel_action = story.story_actions.create(name: "travel")

#### PARAMETERS

travel_traveller_param = travel_action.action_parameters.create(name: "traveller",
  parameter_type: character_type)
travel_from_param      = travel_action.action_parameters.create(name: "from",
  parameter_type: place_type)
travel_to_param        = travel_action.action_parameters.create(name: "to",
  parameter_type: place_type)

#### PRECONDITIONS

at_precondition = travel_action.action_preconditions.create(predicate_definition: at_predicate)
at_precondition.action_inputs.create([
  {
    action_parameter: travel_traveller_param,
    predicate_input: at_character_input
  },
  {
    action_parameter: travel_from_param,
    predicate_input: at_place_input
  }
])

#### EFFECTS

at_from_effect = travel_action.action_effects.create(predicate_definition: at_predicate, negative: true)
at_from_effect.action_inputs.create([
  {
    action_parameter: travel_traveller_param,
    predicate_input: at_character_input
  },
  {
    action_parameter: travel_from_param,
    predicate_input: at_place_input
  }
])

at_to_effect = travel_action.action_effects.create(predicate_definition: at_predicate)
at_to_effect.action_inputs.create([
  {
    action_parameter: travel_traveller_param,
    predicate_input: at_character_input
  },
  {
    action_parameter: travel_to_param,
    predicate_input: at_place_input
  }
])

#### AGENTS

travel_action.action_agents.create(action_parameter: travel_traveller_param)

# ## ATTACK

# attack_action  = story.actions.create(name: "attack")
# attack_action.action_preconditions.create(name: "alive",
#                                           action_inputs: [{name: "traveller"}] }])
# attack_action.action_effects.create(name: "alive",
#                                           action_inputs: [{name: "traveller"}] }])
# attack_action.action_agents.create([{name: "traveller"}])

# ## COLLECT

# collect_action = story.actions.create(name: "collect")
# collect_action.action_preconditions([{}])
# collect_action.action_effects([{}])
# collect_action.action_agents([{}])

# ## RUIN

# ruin_action    = story.actions.create(name: "ruin")
# ruin_action.action_preconditions([{}])
# ruin_action.action_effects([{}])
# ruin_action.action_agents([{}])

# ## CLAIM

# claim_action   = story.actions.create(name: "claim")
# claim_action.action_preconditions([{}])
# claim_action.action_effects([{}])
# claim_action.action_agents([{}])

