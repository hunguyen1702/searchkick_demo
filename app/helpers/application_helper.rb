module ApplicationHelper
  FLASH_TYPE = {
    success: "alert-success", error: "alert-error", failed: "alert-failed",
    alert: "alert-info", notice: "alert-info", danger: "alert-danger"
  }.freeze

  def flash_class type
    FLASH_TYPE[type] || type.to_s
  end

  def post_content posts
    posts.with_highlights.map do |post, highlight_content|
      highlight_content.keys.each do |key|
        post.send (key.to_s + "=").to_sym, highlight_content[key]
      end
      post
    end
  rescue NoMethodError
    posts
  end
end
