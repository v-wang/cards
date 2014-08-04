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

require 'test_helper'

class CardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
