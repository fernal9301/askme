class HashtagsController < ApplicationController
  def show
    @hashtag = Hashtag.find(params.require(:id))
  end
end
