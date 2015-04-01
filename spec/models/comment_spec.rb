require_relative '../spec_helper'

let(:user) {User.create(username:'Ryan', password:'123')}

describe 'Record' do

  it "Should return the username from an id" do
    get '/sealions'
    expect(user.find_owner(1)).to eq("Ryan")
  end
end