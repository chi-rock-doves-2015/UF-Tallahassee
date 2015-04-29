class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string :title
      t.string :hypothesis
      t.string :background
      t.belongs_to :faculty
      t.timestamps null: false
    end
  end
end
