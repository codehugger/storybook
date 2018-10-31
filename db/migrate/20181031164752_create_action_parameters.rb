class CreateActionParameters < ActiveRecord::Migration[5.2]
  def change
    create_table :action_parameters do |t|
      t.belongs_to :story_action, foreign_key: true
      t.string :name
      t.belongs_to :parameter_type, foreign_key: true

      t.timestamps
    end
  end
end
