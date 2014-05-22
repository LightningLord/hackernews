class VotesController < ApplicationController
  include ApplicationHelper
  def create
    vote = Vote.new(params[:vote_data])
    if vote.save
      votable = vote.votable_type.constantize.find(vote.votable_id)
      votable.update_vote_count(vote.value)
      current_user.votes << vote
    end
    render json: {points: votable.vote_count}.to_json
  end
end
