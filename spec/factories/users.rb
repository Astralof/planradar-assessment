FactoryBot.define do
  factory :user do
    name { "test" }
    mail { "test" }
    wants_notifications { true }
    send_due_date_reminder { 1 }
    due_date_reminder_time { Time.now }
  end
end