# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe User do

  before do
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }


  it "Should have email as test_user@test.com" do
    @user.email.should == 'user@example.com'
  end
  it "should have name as test_user1" do
    @user.name.should == 'Example User'
  end

  describe " Name and email cannot be blank" do
    it "Name cannot be blank " do
      @user.name=""
      @user.should_not be_valid
    end
    it "email address cannot be blank " do
      @user.email=""
      @user.should_not be_valid
    end
    it "name length should be less than 50" do
      @user.name='a'*51
      @user.should_not be_valid
    end

    it "Should have valid email addresses" do
        list_of_emails=%w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
        list_of_emails.each do
        |email1| @user.email=email1
          @user.should be_valid
        end
        end
        it "Should have invalid email addresses" do
          list_of_emails=%w[user@foo,com user_at_foo.org example.user@foo foo@bar_baz.com foo@bar+baz.com]
          list_of_emails.each do
          |email1| @user.email=email1
            @user.should_not be_valid
          end

        end
    describe "should have unique email address" do
      before {
      another_user=@user.dup
      another_user.email = @user.email.upcase
      another_user.save
      }
      it { should_not be_valid }
    end
  end
  describe "when password is not present" do
    before { @user.password = @user.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
    before { @user.password_confirmation = nil }
    it { should_not be_valid }
  end
  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end
  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email) }

    describe "with valid password" do
      it { should == found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not == user_for_invalid_password }
      specify { user_for_invalid_password.should be_false }
    end
  end
end
