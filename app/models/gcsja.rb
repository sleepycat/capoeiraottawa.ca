class Gcsja < ActiveRecord::Base

  validates :welcome, :haml_syntax => true


  def Gcsja.attrs_rgx
    "/#{Gcsja.attrs.join('/')}/"
  end

  def Gcsja.attrs
    Gcsja.column_names.reject{|cn| cn =~ /created_at|updated_at|id/ }
  end

end
