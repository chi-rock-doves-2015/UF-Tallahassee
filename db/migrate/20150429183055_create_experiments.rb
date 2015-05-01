class CreateExperiments < ActiveRecord::Migration
  def change
    create_table :experiments do |t|
      t.belongs_to :proposal
      t.belongs_to :researcher
      t.string :status
      t.string :title
      t.text :summary
      t.text :methodology
      t.text :conclusion
      t.timestamps null: false
    end
  end
end
