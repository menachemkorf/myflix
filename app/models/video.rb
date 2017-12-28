class Video < ActiveRecord::Base
  belongs_to :category
  has_many :reviews, -> {order ('created_at DESC')}

  validates_presence_of :title, :description

  def self.search_by_title(term)
    return [] if term.blank?
    self.where("title LIKE ?", "%#{term}%").order("created_at DESC")
  end
end