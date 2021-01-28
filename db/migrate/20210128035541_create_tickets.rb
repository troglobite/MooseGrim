class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.text :description
      t.string :pr_url
      t.string :ticket_url
      t.string :status
      t.text :notes

      t.timestamps
    end
  end
end
