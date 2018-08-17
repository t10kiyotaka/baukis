require 'rails_helper'

describe Admin::Authenticator do
  describe "#authenticate" do

    example 'return true when correct password' do
      m = build(:administrator)
      expect(Admin::Authenticator.new(m).authenticate('pw')).to be_truthy
    end

    example 'return false when wrong password' do
      a = build(:administrator)
      expect(Admin::Authenticator.new(a).authenticate('xy')).to be_falsey
    end

    example 'return false password does not exitst' do
      a = build(:administrator, password: nil)
      expect(Admin::Authenticator.new(a).authenticate(nil)).to be_falsey
    end

    example 'return true whenever suspended' do
      a = build(:administrator, suspended: true)
      expect(Admin::Authenticator.new(a).authenticate('pw')).to be_truthy
    end

  end

end
