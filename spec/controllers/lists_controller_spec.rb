require 'rails_helper'

describe ListsController do 
  
  include Devise::TestHelpers

  before do
    @user = create(:user)
    @list = create(:list)
    sign_in @user
  end

  describe '#create' do
    it "creates a list by the current user" do
      expect( @user.list ).to be_nil

      post :create, { list: {title: "Test"} }

      @user.reload
      expect( @user.list ).not_to be_nil
    end
  end

  describe '#destroy' do
    it "destroys the list for the current user" do
      list = @user.create_list(title: "Whatever")
      expect( @user.list ).not_to be_nil

      delete :destroy, { id: list.id }

      @user.reload
      expect( @user.list ).to be_nil
    end
  end
end