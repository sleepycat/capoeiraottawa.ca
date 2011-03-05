 class HamlSyntaxValidator < ActiveModel::EachValidator  
   def validate_each(object, attribute, value)  
      #TODO: add a render context here to allow Rails view helpers
      #to be used in the haml content
      begin
      engine = Haml::Engine.new(value)
      puts engine.render
      rescue Haml::SyntaxError => e
         object.errors[attribute] <<e.message
      end  
   end  
 end 
