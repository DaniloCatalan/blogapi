# frozen_string_literal: true

# search
class PostsSearchService
  def self.search(current_posts, query)
    posts_ids = Rails.cache.fetch("posts_search/#{query}", expire_in: 1.hours) do
      current_posts.where('title LIKE ?', "%#{query}%").map(&:id)
    end
    current_posts.where(id: posts_ids)
  end
end
