 class HamlSyntaxValidator < ActiveModel::EachValidator  
   def validate_each(object, attribute, value)  
      engine = Haml::Engine.new(value)
      begin
        engine.render
      rescue Exception => e
       object.errors[attribute] <<e.to_s
     end  
   end  
 end 
