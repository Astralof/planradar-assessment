class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string  :name,                      limit: 255
      t.string  :mail,                      limit: 255
      t.integer :send_due_date_reminder,    limit: 1
      t.integer :due_date_reminder_interval
      t.time    :due_date_reminder_time
      t.string  :time_zone,                 limit: 60

      t.timestamps
    end
  end
end
