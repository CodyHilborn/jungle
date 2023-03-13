require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do

    it "should save when all fields are filled in properly" do
      @test_user = User.new(
        first_name: "Cody",
        last_name: "Hilborn",
        email: "cody@hilborn.com",
        password: "wombocombo",
        password_confirmation: "wombocombo"
      )
      expect(@test_user).to be_valid
    end

    it "should fail when first name is empty" do
      @test_user = User.new(
        first_name: nil,
        last_name: "Hilborn",
        email: "cody@hilborn.com",
        password: "wombocombo",
        password_confirmation: "wombocombo"
      )
      expect(@test_user).not_to be_valid
      expect(@test_user.errors.full_messages).to include("First name can't be blank")
    end
    
    it "should fail when last name is empty" do
      @test_user = User.new(
        first_name: "Cody",
        last_name: nil,
        email: "cody@hilborn.com",
        password: "wombocombo",
        password_confirmation: "wombocombo"
      )
      expect(@test_user).not_to be_valid
      expect(@test_user.errors.full_messages).to include("Last name can't be blank")
    end

    it "should fail when email is empty" do
      @test_user = User.new(
        first_name: "Cody",
        last_name: "Hilborn",
        email: nil,
        password: "wombocombo",
        password_confirmation: "wombocombo"
      )
      expect(@test_user).not_to be_valid
      expect(@test_user.errors.full_messages).to include("Email can't be blank")
    end

    it "should fail when password is empty" do
      @test_user = User.new(
        first_name: "Cody",
        last_name: "Hilborn",
        email: "cody@hilborn.com",
        password: nil,
        password_confirmation: "wombocombo"
      )
      expect(@test_user).not_to be_valid
      expect(@test_user.errors.full_messages).to include("Password can't be blank")
    end

    it "should fail when password confirmation is empty" do
      @test_user = User.new(
        first_name: "Cody",
        last_name: "Hilborn",
        email: "cody@hilborn.com",
        password: "wombocombo",
        password_confirmation: nil
      )
      expect(@test_user).not_to be_valid
      expect(@test_user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it "should fail when password & password confirmation dont match" do
      @test_user = User.new(
        first_name: "Cody",
        last_name: "Hilborn",
        email: "cody@hilborn.com",
        password: "fuzzyduck",
        password_confirmation: "duckyfuzz"
      )
      expect(@test_user).not_to be_valid
      expect(@test_user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "should fail when password is less than 7 characters" do
      @test_user = User.new(
        first_name: "Cody",
        last_name: "Hilborn",
        email: "cody@hilborn.com",
        password: "monkey",
        password_confirmation: "monkey"
      )
      expect(@test_user).not_to be_valid
      expect(@test_user.errors.full_messages).to include("Password is too short (minimum is 7 characters)")
    end

    it "should fail if email is already in use" do
      @test_user1 = User.new(
        first_name: "Cody",
        last_name: "Hilborn",
        email: "cody@hilborn.com",
        password: "wombocombo",
        password_confirmation: "wombocombo"
      )
      @test_user1.save

      @test_user2 = User.new(
        first_name: "Jim",
        last_name: "Jenkins",
        email: "cody@hilborn.com",
        password: "wombocombo",
        password_confirmation: "wombocombo"
      )
      expect(@test_user2).not_to be_valid
      expect(@test_user2.errors.full_messages).to include("Email has already been taken")
    end

  end

  describe ".authenticate_with_credentials" do
    it "should authenticate when given proper credentials" do
      @test_user = User.new(
        first_name: "Cody",
        last_name: "Hilborn",
        email: "cody@hilborn.com",
        password: "wombocombo",
        password_confirmation: "wombocombo"
      )
      @test_user.save

      @test_user = User.authenticate_with_credentials("cody@hilborn.com", "wombocombo")
      expect(@test_user).not_to be_nil
    end

    it "should not authenticate when given improper credentials" do
      @test_user = User.new(
        first_name: "Cody",
        last_name: "Hilborn",
        email: "cody@hilborn.com",
        password: "wombocombo",
        password_confirmation: "wombocombo"
      )
      @test_user.save

      @test_user = User.authenticate_with_credentials("cody@hilborn.com", "duckyfuzz")
      expect(@test_user).to be_nil
    end

    it "should authenticate when given email with different casing" do
      @test_user = User.new(
        first_name: "Cody",
        last_name: "Hilborn",
        email: "cody@hilborn.com",
        password: "wombocombo",
        password_confirmation: "wombocombo"
      )
      @test_user.save

      @test_user = User.authenticate_with_credentials("CoDy@hIlBoRn.com", "wombocombo")
      expect(@test_user).not_to be_nil
    end

    it "should authenticate when given email with spaces" do
      @test_user = User.new(
        first_name: "Cody",
        last_name: "Hilborn",
        email: "cody@hilborn.com",
        password: "wombocombo",
        password_confirmation: "wombocombo"
      )
      @test_user.save

      @test_user = User.authenticate_with_credentials("   cody@hilborn.com   ", "wombocombo")
      expect(@test_user).not_to be_nil
    end
  end
end
