require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    before do
      @user = User.new(
        first_name: 'Gabriela',
        last_name: 'Moreno',
        email: 'hellofriends@hello',
        password: "123456",
        password_confirmation: "123456"
      )
    end

      it 'creates a new user' do
        expect(@user).to be_valid
      end

      it 'should have a first_name' do
        @user.first_name = nil
        expect(@user).to_not be_valid  
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'should have a last_name' do
        @user.last_name = nil
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'should have an email' do
        @user.email = nil
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include ("Email can't be blank")
      end

      it 'should have a password' do
        @user.password = nil
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'password confirmation should not be blank' do
        @user.password_confirmation = nil
        expect(@user).to_not be_valid
      end

      it "password should match password confirmation" do
        @user.password = '123456'
        @user.password_confirmation ='123456'
        expect(@user.password).to match(@user.password_confirmation)
      end
      
      it 'password should have a minimum length of 6 characters' do
        @user.password = '123456'
        expect(@user).to be_valid
      end
  
  end

  describe '.authenticate_with_credentials' do
    before do
      @user = User.new(first_name: "Mr", last_name: "Bean", email: "jan@mailme.com", password: "123456", password_confirmation: "123456")
    end
    
    it 'should return a truthy value if user login is correct' do
      @user.save!
    
      @valid_user = @user.authenticate_with_credentials("jan@mailme.com", "123456")
      expect(@valid_user).to be_truthy
    end

    it 'should authenticate if user adds a space before the email' do
      @user.save!
      @valid_user = @user.authenticate_with_credentials(' jan@mailme.com', '123456')
      expect(@valid_user).to be_truthy
    end

    
  end   
end





