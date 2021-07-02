class TweetJob < ApplicationJob
  queue_as :default

  def perform(tweet)
    return if tweet.published?
    # Rescheduled a tweet to the future
    return if tweet.publish_at > Time.current

    tweet.publish_to_twitter!
  end
end

# Push the publish_at forward
# noon -> Bam

# Bam -> sets tweet id
# 9am -> 1pm