class CreateLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :logs do |t|
      t.belongs_to :ticket, foreign_key: true
      t.string :description
      t.timestamps
    end
  end
end
