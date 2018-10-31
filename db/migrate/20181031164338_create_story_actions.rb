class CreateStoryActions < ActiveRecord::Migration[5.2]
  def change
    create_table :story_actions do |t|
      t.belongs_to :story, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
