class CreateActionAgents < ActiveRecord::Migration[5.2]
  def change
    create_table :action_agents do |t|
      t.belongs_to :story_action, foreign_key: true
      t.belongs_to :action_parameter, foreign_key: true

      t.timestamps
    end
  end
end
