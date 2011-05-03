class Gcsja < ActiveRecord::Base

  validates :welcome, :about, :haml_syntax => true, :unless => lambda{|x| x.nil?}
  translates :welcome, :about

  def Gcsja.attrs_rgx
    "/#{Gcsja.attrs.join('|')}/"
  end

  def Gcsja.attrs
    Gcsja.column_names.reject{|cn| cn =~ /created_at|updated_at|id/ }
  end

end
