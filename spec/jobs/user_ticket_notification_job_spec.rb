RSpec.describe UserTicketNotificationJob, :type => :job do
  describe "#perform_later" do
    context 'user wants notifications' do 
      it "matches with enqueued mailer" do
        ActiveJob::Base.queue_adapter = :test
        expect {
          UserTicketNotificationJob.perform_later(FactoryBot.create(:ticket))
        }.to have_enqueued_job(UserTicketNotificationJob).at_least(2).times
      end
    end

    context 'user wants no notifications' do
      let(:user) { FactoryBot.create(:user, wants_notifications: false) }
      it "matches with enqueued mailer" do
        ActiveJob::Base.queue_adapter = :test
        expect {
          UserTicketNotificationJob.perform_later(FactoryBot.create(:ticket, user: user))
        }.to have_enqueued_job(UserTicketNotificationJob).at_least(1).times
      end
    end
  end
end