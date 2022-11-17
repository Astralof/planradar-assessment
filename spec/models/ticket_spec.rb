RSpec.describe Ticket, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.create(:ticket)).to be_valid
  end
end