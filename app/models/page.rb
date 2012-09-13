class Page < ActiveRecord::Base

  translates :title, :content
  attr_accessible :content, :sort_order, :title
  validates_uniqueness_of :title
  validates_presence_of :title, :content

  def to_param
    self.title
  end

end
