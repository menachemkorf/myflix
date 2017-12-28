require 'spec_helper'

describe SessionsController do
  describe "get :new" do
    it "redirects to home page if alraedy logged in" do
      session[:user_id] = Fabricate(:user).id
      get :new
      expect(response).to redirect_to home_path
    end
  end

  describe "post :create" do
    context "with valid credentials" do
      let(:alice) { Fabricate(:user) }

      before do
        post :create, email: alice.email, password: alice.password
      end

      it "sets session to current user" do
        expect(session[:user_id]).to eq(alice.id)
      end

      it "redirects to home page" do
        expect(response).to redirect_to home_path
      end

      it "sets the notice" do
        expect(flash[:notice]).not_to be_blank
      end
    end
    context "with invalid credentials" do
      let(:alice) { Fabricate(:user, password: 'secret') }

      before do
        post :create, email: alice.email, password: 'wrong_pass'
      end

      it "does not create session" do
        expect(session[:user_id]).to be_nil
      end

      it "sets error" do
        expect(flash[:error]).not_to be_blank
      end

      it "redirects to sign in page" do
        expect(response).to redirect_to sign_in_path
      end
    end
  end

  describe "delete :destroy" do
    before do
      session[:user_id] = Fabricate(:user).id
      delete :destroy
    end

    it "removes user from session" do
      expect(session[:user_id]).to be_nil
    end
    it "sets notice" do
      expect(flash[:notice]).not_to be_blank
    end
    it "redirects to root" do
      expect(response).to redirect_to root_path
    end
  end
end