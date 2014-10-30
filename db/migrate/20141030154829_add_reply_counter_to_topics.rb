class AddReplyCounterToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :reply_counter, :integer
  end
end
