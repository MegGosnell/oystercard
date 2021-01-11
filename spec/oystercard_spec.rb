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

  it 'raises an error if the maximum balance is exeeded' do
    subject.top_up(subject.max)
    expect { subject.top_up (1) }.to raise_error "maximum balance reached #{subject.max}"
  end

  it 'decreases balance by topped up amount' do
    prior_balance = subject.balance
    amount = 3
    subject.deduct(amount)
    expect(subject.balance).to eq (prior_balance - amount)
  end

  it 'touches in' do
    subject.touch_in
    expect(subject.in_use).to eq true
  end

  it 'touches out' do
    subject.touch_out
    expect(subject.in_use).to eq false
  end

  it 'knows when is in use' do
    subject.touch_in
    expect { subject.touch_in}.to raise_error "Already in use"
  end
end
