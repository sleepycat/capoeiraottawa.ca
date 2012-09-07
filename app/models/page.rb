class Page < ActiveRecord::Base

  attr_accessible :content, :sort_order, :title
  validates_uniqueness_of :title

  def to_param
    self.title
  end

end
