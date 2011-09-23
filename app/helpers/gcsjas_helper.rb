module GcsjasHelper
  def  parse_haml content
    #XXX - this content tag is a suspect in the validation errors.
    content_tag :p do
    Haml::Engine.new(content).render.html_safe unless content.class == NilClass
    end
  end
end
