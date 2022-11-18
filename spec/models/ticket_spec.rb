RSpec.describe Ticket, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.create(:ticket)).to be_valid
  end

  describe 'callbacks' do
    describe 'after_create' do
      describe '#set_user_notification' do
        subject { FactoryBot.create(:ticket) }

        it 'have enqueued job UserTicketNotificationJob' do
          ActiveJob::Base.queue_adapter = :test
          expect { subject }.to have_enqueued_job(UserTicketNotificationJob)
        end
      end
    end
  end

  describe '#user_reminder_time_in_seconds' do
    subject { ticket.user_reminder_time_in_seconds }
    
    let(:ticket) { FactoryBot.create(:ticket, user: user) }
    let(:user) { FactoryBot.create(:user, due_date_reminder_time: time) }
    let(:time)  { Time.now }

    it 'returns the right time in seconds' do
      expect(subject).to eq(time.seconds_since_midnight.seconds)
    end
  end

  describe '#notification_datetime' do
    subject { ticket.notification_datetime }
    
    let(:ticket) { FactoryBot.create(:ticket, user: user) }
    let(:user) { FactoryBot.create(:user, due_date_reminder_time: time) }
    let(:time)  { Time.now }

    it 'returns the right time in seconds' do
      expect(subject.to_s).to eq(time.to_datetime.to_s)
    end
  end
end