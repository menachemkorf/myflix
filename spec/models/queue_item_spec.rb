require 'spec_helper'

describe QueueItem do
  it { should belong_to(:user) }
  it { should belong_to(:video) }

  describe '#video_title' do
    it "returns the title of the associated video" do
      monk = Fabricate(:video)
      queue_item = Fabricate(:queue_item, video: monk)
      expect(queue_item.video_title).to eq(monk.title)
    end
  end

  describe "#rating" do
    it "returns the rating from the review when the review is present" do
      alice = Fabricate(:user)
      monk = Fabricate(:video)
      review = Fabricate(:review, video: monk, user: alice, rating: 4)
      queue_item = Fabricate(:queue_item, video: monk, user: alice)
      expect(queue_item.rating).to eq(4)
    end
    it "returns nil when the review is not present" do
      alice = Fabricate(:user)
      monk = Fabricate(:video)
      queue_item = Fabricate(:queue_item, video: monk, user: alice)
      expect(queue_item.rating).to be_nil
    end
  end

  describe "#category_name" do
    it "returns the video category name" do
      cat = Fabricate(:category)
      monk = Fabricate(:video, category: cat)
      queue_item = Fabricate(:queue_item, video: monk)
      expect(queue_item.category_name).to eq(cat.name)
    end
  end

  describe "#category" do
    it "returns the category of the video" do
      cat = Fabricate(:category)
      monk = Fabricate(:video, category: cat)
      queue_item = Fabricate(:queue_item, video: monk)
      expect(queue_item.category).to eq(cat)
    end
  end
end