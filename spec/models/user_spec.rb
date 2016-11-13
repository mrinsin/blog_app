require 'rails_helper'

RSpec.describe User, type: :model do

  it "should have a name, email and password" do

    user = User.new(full_name: 'Mrinalini Sinha', email_address: 'mrin@sin.com', password: 'mrinsin')

    expect(user.save).to be true

    user2 = User.find_by_email_address('mrin@sin.com')
    expect(user2.full_name).to eq 'Mrinalini Sinha'
    expect(user2.password).to eq 'mrinsin'

  end
end
