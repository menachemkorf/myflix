require 'spec_helper'

describe VideosController do
  describe "GET show" do
    it "sets the @video variable for authenticated users" do
      session[:user_id] = Fabricate(:user).id
      video = Fabricate(:video)
      get :show, id: video.id
      expect(assigns(:video)).to eq(video)
    end

    it "sets @reviews for authenticated users" do
      session[:user_id] = Fabricate(:user).id
      video = Fabricate(:video)
      review1 = Fabricate(:review, video: video)
      review2 = Fabricate(:review, video: video)
      get :show, id: video.id
      expect(assigns(:reviews)).to match_array([review1, review2])
    end


    it "redirects to sign in page for unauthenticated users" do
      video = Fabricate(:video)
      get :show, id: video.id
      expect(response).to redirect_to sign_in_path
    end
  end

  describe "GET search" do
    it "sets the @video variable for authenticated users" do
      session[:user_id] = Fabricate(:user).id
      video = Fabricate(:video, title: 'monk')
      get :search, search_term: 'onk'
      expect(assigns(:videos)).to eq([video])
    end

    it "redirects to sign in page for unauthenticated users" do
      video = Fabricate(:video, title: 'monk')
      get :search, search_term: 'onk'
      expect(response).to redirect_to sign_in_path
    end
  end
end