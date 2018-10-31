class CreateActionPreconditions < ActiveRecord::Migration[5.2]
  def change
    create_table :action_preconditions do |t|
      t.belongs_to :story_action, foreign_key: true
      t.belongs_to :predicate_definition, foreign_key: true
      t.boolean :negative

      t.timestamps
    end
  end
end
