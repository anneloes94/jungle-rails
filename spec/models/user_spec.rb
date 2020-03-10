require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
#     It must be created with a password and password_confirmation fields
#     These need to match so you should have an example for where they are not the same
#     These are required when creating the model so you should also have an example for this
# Emails must be unique (not case sensitive; for example, TEST@TEST.com should not be allowed if test@test.COM is in the database)
# Email, first name, and last name should also be required

    it 'does not save correctly when password and password_confirmation do not match' do
    end

    it 'does not save correctly when password and password_confirmation are not entered' do
    end

    it 'should not allow case-sensitivity for emails' do
    end

    it 'does not save correctly once email is not set and validated' do
    end

    it 'does not save correctly once first_name is not set and validated' do
    end

    it 'does not save correctly once last_name is not set and validated' do
    end
  end
end
