class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.string      :title, limit: 255
      t.text        :description
      t.references  :user, foreign_key: true, index: true
      t.date        :due_date
      t.integer     :status_id
      t.integer     :progress
      t.timestamps
    end
  end
end
