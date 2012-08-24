require 'spec_helper'

describe PagesController do
  describe "/foo" do
    it "should show foo" do
      visit '/en/foo'
      assigns(:page).should should == "foo"
    end
  end
end
