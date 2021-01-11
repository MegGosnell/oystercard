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
    expect(subject).to respond_to(:deduct).with(1).argument
  end 
end  
