class CreatePredicateDefinitions < ActiveRecord::Migration[5.2]
  def change
    create_table :predicate_definitions do |t|
      t.belongs_to :story, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
