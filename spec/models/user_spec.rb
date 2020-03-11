require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

  user = User.create({ first_name: "Bob", last_name: "Bobberson" , email: "bobbobberson@bob.com", password: "hello", password_confirmation: "hello" })

    it 'saves correctly when all fields are entered correctly' do
      user1 = user
      user1.save
      expect(User.find_by(last_name: "Bobberson")).not_to be_nil
    end

    it 'should have password matching with password_confirmation' do
      user2 = user
      user2.password = "Hello"
      user2.password_confirmation = "hello"
      user2.save
      expect(user2.password).not_to eq(user2.password_confirmation)
    end

    it 'should not save correctly when password and password_confirmation are not entered' do
      user3 = user
      user3.password_confirmation = nil
      user3.save
      expect(user3).to_not be_valid
    end

    it 'should not allow a new user to enter the same email address -> case-sensitivity' do
      # p user4
      user4 = user
      user4.email = "BobBobberson@Bob.com"
      user4.save
      expect(User.find_by(id: 4)).to be_nil
    end

    it 'should not save correctly once email is not set and validated' do
      user5 = user
      user5.email = nil
      user5.save
      expect(User.find_by(id: 5)).to be_nil
    end

    it 'should not save correctly once first_name is not set and validated' do
      user6 = user
      user6.first_name = nil
      user6.save
      expect(User.find_by(id: 6)).to be_nil
    end

    it 'should not save correctly once last_name is not set and validated' do
      user7 = user
      user.last_name = nil
      user.save
      expect(User.find_by(id: 7)).to be_nil
    end
  end
end
