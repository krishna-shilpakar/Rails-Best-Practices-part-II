module PostsHelper
  def list_posts(posts)
    raw( posts.each do |post|
      content_tag(:h4) do
        link_to "#{post.title} (#{post.comments.length})", user_post_path(current_user,post)
      end + post.text
    end.join )
  end
end
