 class HamlSyntaxValidator < ActiveModel::EachValidator  
   def validate_each(object, attribute, value)  
      #TODO: add a render context here to allow Rails view helpers
      #to be used in the haml content
      if value
        begin
        engine = Haml::Engine.new(value)
        engine.render
        rescue Haml::SyntaxError => e
           object.errors[attribute] << e.message
        end  
      else
       puts "Haml validation: There was no value for #{attribute}"
      end
   end  
 end 
