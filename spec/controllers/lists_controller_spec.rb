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
      expect( @user.list.find_by_list_id(@list.id) ).to be_nil

      list :create, { list_id: @list.id }

      expect( @user.list.find_by_list_id(@list.id) ).not_to be_nil
    end
  end

  describe '#destroy' do
    it "destroys the list for the current user" do
      list = @user.list.where(list: @list).create
      expect( @user.list.find_by_list_id(@list.id) ).not_to be_nil

      delete :destroy, { id: list.id }

      expect( @user.list.find_by_list_id(@list.id) ).to be_nil
    end
  end
end