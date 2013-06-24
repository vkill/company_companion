class StandardResponder < ActionController::Responder

  # gem responders
  include Responders::FlashResponder
  include Responders::HttpCacheResponder

  def to_format
    if get? && !resource
      controller.response.status = :not_found
    elsif post?
      controller.response.status = :created
    elsif put?
      controller.response.status = :no_content
    elsif delete?
      controller.response.status = :no_content
    end

    super
  end
end
