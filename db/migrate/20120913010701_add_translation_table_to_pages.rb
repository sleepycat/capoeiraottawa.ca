class AddTranslationTableToPages < ActiveRecord::Migration

  def up
    Page.create_translation_table! title: :text, content: :text
  end

  def down
    #Not sure there is a way to reverse that cleanly...
  end

end
