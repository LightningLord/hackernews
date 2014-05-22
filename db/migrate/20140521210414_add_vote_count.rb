class AddVoteCount < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.integer :vote_count, default: 0
    end

    change_table :comments do |t|
      t.integer :vote_count, default: 0
    end
  end
end
