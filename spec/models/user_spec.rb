require 'rails_helper'

RSpec.describe User, :type => :model do
    subject {
        described_class.new(email: "teste",
            password_digest: "123")
    }
    it "is valid with valid attributes" do
        expect(subject).to be_valid
    end
    it "is not valid without a email" do
        subject.email = nil
        expect(subject).to_not be_valid
    end
    it "is not valid without a password_digest" do
        subject.password_digest = nil
        expect(subject).to_not be_valid
    end
end
