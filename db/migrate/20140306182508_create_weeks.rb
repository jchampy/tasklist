class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.string :title
      t.string :completed_by
      t.boolean :completed

      t.timestamps
    end
  end
end
