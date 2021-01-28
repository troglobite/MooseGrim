class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.string :title
      t.string :jira_url
      t.string :github_url
      t.string :status
      t.string :update

      t.timestamps
    end
  end
end
