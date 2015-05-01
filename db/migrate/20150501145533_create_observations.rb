class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.belongs_to :experiment
      t.string :heading
      t.text :body

      t.timestamps null: false
    end
  end
end
