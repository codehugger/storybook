class CreateActionInputs < ActiveRecord::Migration[5.2]
  def change
    create_table :action_inputs do |t|
      t.belongs_to :action_inputable, polymorphic: true, index: false
      t.belongs_to :predicate_input, foreign_key: true
      t.belongs_to :action_parameter, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
