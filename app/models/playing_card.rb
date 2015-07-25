class PlayingCard < ActiveRecord::Base
  def name
    "#{range}#{suite}"
  end
end
