class CreateLevels < ActiveRecord::Migration[5.1]
  def change
    create_table :levels do |t|
      t.integer :level
      t.bigint :min_score
      t.bigint :max_score

    end
  end
end
