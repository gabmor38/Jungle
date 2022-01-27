require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    before do
      @user = User.new({
        first_name: 'Gabriela',
        last_name: 'Moreno',
        email: 'hello@hello',
        password: "123",
        password_confirmation: "123"
      })
    end
      it 'creates a new user' do
        expect(@user.save).to be true
      end

      it 'should have a first_name' do
        @user.first_name = nil
        @user.save
        expect(@user).to_not be_valid  
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'should have a last_name' do
        @user.last_name = nil
        @user.save
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'should have an email' do
        @user.email = nil
        @user.save
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include ("Email can't be blank")
      end

      it 'should have a password' do
        @user.password = nil
        @user.save
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'password_confirmation should be present' do
        @user.password_confirmation = nil
        @user.save
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
      end

      it "password should match password confirmation" do
        @user.password = '123'
        @user.password_confirmation ='123'
        @user.save
        expect(@user.password).to match(@user.password_confirmation)
      end
      
      it 'password should have a minimum length of 8 characters' do
        @user.password = '123'
        @user.password_confirmation = '123'
        expect(@user.password).to_not be_valid
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
      end
    
  end
end
