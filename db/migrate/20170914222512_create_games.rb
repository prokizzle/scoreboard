class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.timestamp :start_time
      t.timestamp :end_time
      t.references :service, foreign_key: {to_table: :players}

      t.timestamps
    end
  end
end
