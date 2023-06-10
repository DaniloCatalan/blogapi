# frozen_string_literal: true

# search
class PostsSearchService
  def self.search(current_posts, query)
    current_posts.where('title LIKE ?', "%#{query}%")
  end
end
