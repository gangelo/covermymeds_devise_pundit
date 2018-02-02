require 'rails_helper'

RSpec.describe User, type: :model do
  context "factories" do
    describe "#user" do
      subject { FactoryBot.build(:user) }
      it { should be_valid }
    end
  end

  context "validations" do
    describe "#email" do
      it { should validate_length_of(:email).is_at_least(3).with_message("must be between 3 and 254 characters") }
      it { should validate_length_of(:email).is_at_most(254).with_message("must be between 3 and 254 characters") }
      it { should_not allow_value("something.at.somewhere.com").for(:email) }
      it { should allow_value("something@somewhere.com").for(:email) }

      it "should be unique, case-insensitive" do
        User.create(email: "user_1@gmail.com", password: "password")
        non_unique_user = User.create(email: "user_1@gmail.com", password: "password")
        expect(non_unique_user).not_to be_valid
      end
    end

    describe "#user_name" do
      it { should allow_value(nil).for(:user_name) }
      it { should allow_value("").for(:user_name) }
      it { should allow_value("username").for(:user_name) }
      it { should allow_value("UserName").for(:user_name) }
      it { should allow_value("username100").for(:user_name) }
      it { should allow_value("100username").for(:user_name) }
      it { should allow_value("user_100_name").for(:user_name) }
      it { should allow_value("user_name").for(:user_name) }
      it { should_not allow_value("dbl__underscore").for(:user_name) }
      it { should_not allow_value("_bad_underscore").for(:user_name) }
      it { should_not allow_value("bad_underscore_").for(:user_name) }

      it { should validate_length_of(:user_name).is_at_least(3).with_message("must be between 3 and 16 characters") }
      it { should validate_length_of(:user_name).is_at_most(16).with_message("must be between 3 and 16 characters") }

      it { should_not allow_value("xx").for(:user_name).with_message("must be between 3 and 16 characters") }
      it { should_not allow_value("xxxxxxxxxxxxxxxxx").for(:user_name).with_message("must be between 3 and 16 characters") }

      it "should be unique regardless of case" do
         User.create(user_name: "user_1", email: "user_1@gmail.com", password: "password")
         non_unique_user = User.create(user_name: "user_1", email: "user_2@gmail.com", password: "password")
         expect(non_unique_user).not_to be_valid
         # Case insensitive
         non_unique_user = User.create(user_name: "uSeR_1", email: "user_2@gmail.com", password: "password")
         expect(non_unique_user).not_to be_valid
      end
    end
  end
end
