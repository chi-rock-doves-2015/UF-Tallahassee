class CreateExperiments < ActiveRecord::Migration
  def change
    create_table :experiments do |t|
      t.string :title
      t.text :methodology
      t.string :status
      t.text :conclusion
      t.belongs_to :researcher
      t.belongs_to :proposal
      t.timestamps null: false
    end
  end
end
