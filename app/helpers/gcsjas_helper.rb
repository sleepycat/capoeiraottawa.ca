module GcsjasHelper
  def  parse_haml content
    content_tag :p do
    Haml::Engine.new(content).render.html_safe
    end
  end
end
