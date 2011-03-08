class AddTranslationTableForGcsja < ActiveRecord::Migration
  def self.up
    Gcsja.create_translation_table!({
       :about => :text,
        :welcome => :text
      }, {
        :migrate_data => true
      })

  end


  def self.down
   Gcsja.drop_translation_table! :migrate_data => true
  end
end
