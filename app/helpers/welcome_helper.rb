module WelcomeHelper
  def cache_key_for_post_row(post)
    "post-#{post.id}-#{post.updated_at}"
  end
  def cache_key_for_post_user_row(post,id)
    "post-#{post.id}-#{post.updated_at}-#{id}"
  end
end
