class CreatePredicateInputs < ActiveRecord::Migration[5.2]
  def change
    create_table :predicate_inputs do |t|
      t.belongs_to :predicate_definition, foreign_key: true
      t.string :name
      t.belongs_to :parameter_type, foreign_key: true

      t.timestamps
    end
  end
end
