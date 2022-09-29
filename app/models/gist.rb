class Gist < ApplicationRecord
  belongs_to :question
  belongs_to :user

  def url
    "https://api.github.com/gists/#{gist_id}"
  end
end
