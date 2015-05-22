require 'mechanize'

class Poster
  @queue = :poster

  def self.perform
    agent = Mechanize.new
    agent.user_agent_alias = 'Mac Safari'
    page = agent.get 'http://habrahabr.ru'
    post = Post.new
    post_link = page.link_with(class: 'post_title')
    post.title, post.href = post_link.text, post_link.href
  end
end