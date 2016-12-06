require 'test_helper'

class GymTest < ActiveSupport::TestCase
  
  def setup
    @gym = Gym.new(name: "CFHC", email: "mike@crossfithillcrest.com")
  end
  
  test "should be valid" do
    assert @gym.valid?
  end

  test "name should be present" do
    @gym.name = ""
    assert_not @gym.valid?
  end
  
  test "name should not be too long" do
    @gym.name = "a" * 51
    assert_not @gym.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @gym.email = valid_address
      assert @gym.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  
  test "names should be unique" do
    duplicate_gym = @gym.dup
    duplicate_gym.name = @gym.name.upcase
    @gym.save
    assert_not duplicate_gym.valid?
  end

  
end
