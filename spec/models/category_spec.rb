require 'spec_helper'

describe Category do
  it { should have_many(:videos)}
  it { should validate_presence_of(:name) }

  describe '#recent_videos' do
    it 'returns empty array if no videos' do
      comedy = Category.create(name: 'Commedies')
      thriller = Category.create(name: 'Thrillers')
      family = Video.create(title: "Family Guy", description: 'Some description.', category: comedy)

      expect(thriller.recent_videos).to eq([])
    end


    it 'returns all videos from category if less than six' do
      comedy = Category.create(name: 'Commedies')
      thriller = Category.create(name: 'Thrillers')
      family = Video.create(title: "Family Guy", description: 'Some description.', category: comedy)
      monk = Video.create(title: "Monk", description: 'Some description.', category: comedy)

      expect(comedy.recent_videos).to include(monk)
      expect(comedy.recent_videos).to include(family)
    end

    it 'returns newest six videos from category if there are more then six' do
      comedy = Category.create(name: 'Commedies')

      family = Video.create(title: "Family Guy", description: 'Some description.', category: comedy)
      monk = Video.create(title: "Monk", description: 'Some description.', category: comedy)
      monk2 = Video.create(title: "Monk2", description: 'Some description.', category: comedy)
      monk3 = Video.create(title: "Monk3", description: 'Some description.', category: comedy)
      monk4 = Video.create(title: "Monk4", description: 'Some description.', category: comedy)
      monk5 = Video.create(title: "Monk5", description: 'Some description.', category: comedy)
      monk6 = Video.create(title: "Monk6", description: 'Some description.', category: comedy)

      expect(comedy.recent_videos.size).to eq(6)
    end

    it 'returns vidoes in order newest first.' do
      comedy = Category.create(name: 'Commedies')

      family = Video.create(title: "Family Guy", description: 'Some description.', category: comedy, created_at: 10.months.ago)
      monk = Video.create(title: "Monk", description: 'Some description.', category: comedy, created_at: 9.months.ago)
      monk2 = Video.create(title: "Monk2", description: 'Some description.', category: comedy, created_at: 8.months.ago)
      monk3 = Video.create(title: "Monk3", description: 'Some description.', category: comedy, created_at: 7.months.ago)
      monk4 = Video.create(title: "Monk4", description: 'Some description.', category: comedy, created_at: 6.months.ago)
      monk5 = Video.create(title: "Monk5", description: 'Some description.', category: comedy, created_at: 5.months.ago)
      monk6 = Video.create(title: "Monk6", description: 'Some description.', category: comedy, created_at: 4.months.ago)

      # binding.pry

      expect(comedy.recent_videos).to include(monk6)
    end
  end
end