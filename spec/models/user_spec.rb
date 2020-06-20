require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creating" do
  	it "should create valid user" do
  		expect(build(:user)).to be_valid
  	end

  	it "should not be valid with blank password" do
  		expect(build(:user, password: "")).to_not be_valid
  	end

  	it "should not be valid with different password and password confirmation" do
  		expect(build(:user, password: "qweasdzxc", password_confirmation: "qweqweqwe")).to_not be_valid
  	end

  	it "should not be valid with taken name" do
  		create(:user, name: "username")
  		expect(build(:user, name: "username")).to_not be_valid
  	end
  end
end
