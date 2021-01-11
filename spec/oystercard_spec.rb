require 'oystercard'
describe Oystercard do
  it "has a balance of 0 at start" do
    expect(subject.balance).to eq 0
  end

  it "increase balance by topped up amount" do
    prior_balance = subject.balance
    amount = 3
    subject.top_up(amount)
    expect(subject.balance).to eq (prior_balance + amount)
  end
end
