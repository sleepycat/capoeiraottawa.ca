module GcsjasHelper
  def  parse_haml content
    content_tag :p do
    Haml::Engine.new(content).render.html_safe unless content.class == NilClass
    end
  end
end
