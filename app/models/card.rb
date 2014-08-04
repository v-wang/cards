# == Schema Information
#
# Table name: cards
#
#  id         :integer          not null, primary key
#  project_id :integer
#  title      :string(255)
#  body       :text
#  position   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Card < ActiveRecord::Base
  belongs_to :project
end
