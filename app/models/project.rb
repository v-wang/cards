# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Project < ActiveRecord::Base
  belongs_to :user
  has_many :cards, -> {order("position ASC")}, dependent: :destroy
  validates_presence_of :title
  after_create :make_card

  def make_card
  	self.cards.create(title: "New Card", body: "This is your first card!", position: 1)
  end
end
