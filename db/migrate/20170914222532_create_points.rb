class CreatePoints < ActiveRecord::Migration[5.1]
  def change
    create_table :points do |t|
      t.references :player, foreign_key: true
      t.references :game, foreign_key: true
      t.timestamp :created_at

      t.timestamps
    end
  end
end
