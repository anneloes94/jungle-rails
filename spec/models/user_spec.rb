require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    user = User.create({ first_name: "Bob", last_name: "Bobberson" , email: "bobbobberson@bob.com", password: "hello", password_confirmation: "hello" })

    it 'saves correctly when all fields are entered correctly' do
      user.save
      expect(User.find_by(last_name: "Bobberson")).not_to be_nil
    end

    it 'should have password matching with password_confirmation' do
      user.password = "Hello"
      user.password_confirmation = "hello"
      user.save
      expect(user.password).not_to eq(user.password_confirmation)
    end

    it 'should not save correctly when password and password_confirmation are not entered' do
      user.password_confirmation = nil
      user.save
      expect(user).to_not be_valid
    end

    it 'should not allow a new user to enter the same email address -> case-sensitivity' do
      user2 = user
      user2.email = "BobBobberson@Bob.com"
      user2.save
      expect(User.find_by(id: 2)).to be_nil
    end

    it 'should not save correctly once email is not set and validated' do
      user2 = user
      user2.email = nil
      user2.save
      expect(User.find_by(id: 2)).to be_nil
    end

    it 'should not save correctly once first_name is not set and validated' do
      user2 = user
      user2.first_name = nil
      user2.save
      expect(User.find_by(id: 2)).to be_nil
    end

    it 'should not save correctly once last_name is not set and validated' do
      user2 = user
      user2.last_name = nil
      user2.save
      expect(User.find_by(id: 2)).to be_nil
    end

    it 'must have a password of at least 3 characters' do
      user2 = user
      user2.password = "12"
      user2.password_confirmation = "12"
      user2.save
      expect(User.find_by(id: 2)).to be_nil
    end

  end

  describe 'authenticate_with_credentials' do

    user = User.create({ first_name: "Bob", last_name: "Bobberson" , email: "bobbobberson@bob.com", password: "hello", password_confirmation: "hello" })

    it 'should authenticate user when fields are entered correctly' do
      user2 = User.authenticate_with_credentials(user.email, user.password)
      expect(user2).not_to be_nil
    end

    it 'should not authenticate user when password is entered incorrectly' do
      user2 = User.authenticate_with_credentials(user.email, "hola")
      expect(user2).to be_nil
    end

    it 'should not authenticate user is email does not exist' do
      user2 = User.authenticate_with_credentials("idont@exist.com", "banana")
      expect(user2).to be_nil
    end

    it "should authenticate the user despite different casing in email" do
      user2 = User.authenticate_with_credentials('bObBoBbErSoN@bOb.CoM', user.password)
      expect(user2).not_to be_nil
    end

    it "should authenticate the user despite spaces being entered around email" do
      user2 = User.authenticate_with_credentials(' bobbobberson@bob.com ', user.password)
      expect(user2).not_to be_nil
    end






  end



end
