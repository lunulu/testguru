class Gist < ApplicationRecord
  belongs_to :question
  belongs_to :user

  def url
    "https://gist.github.com/lunulu/#{gist_id}"
  end
end
