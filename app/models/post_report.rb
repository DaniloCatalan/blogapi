# frozen_string_literal: true

PostReport = Struct.new(:word_count, :word_histogram) do
  def self.generate(post)
    PostReport.new(
      post.content.split.map { |word| word.gsub(/\W/, '') }.count,
      calc_histogram(post)
    )
  end

  def self.calc_histogram(post)
    post
      .content
      .split
      .map { |word| word.gsub(/\W/, '') }
      .map(&:downcase)
      .group_by { |word| word }
      .transform_values(&:size)
  end
end
