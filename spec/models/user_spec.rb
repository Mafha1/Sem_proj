require 'spec_helper'
describe User do
before do
@user = User.new(name: "Example User", email: "user@example.com")
end
.
.
describe "when email format is invalid" do
it "should be invalid" do
addresses = %w[user@foo,com user_at_foo.org example.user@foo.
foo@bar_baz.com foo@bar+baz.com]
addresses.each do |invalid_address|
@user.email = invalid_address
expect(@user).not_to be_valid
.
describe "when name is too long" do
before { @user.name = "a" * 51 }
it { should_not be_valid }
end
end
end
end
end
