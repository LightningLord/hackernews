module Votable
  def update_vote_count(value)
    self.update_attributes(vote_count: self.vote_count + value)
  end
end
