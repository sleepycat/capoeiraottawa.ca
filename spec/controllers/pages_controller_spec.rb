require 'spec_helper'

describe PagesController do

  # This should return the minimal set of attributes required to create a valid
  # Page. As you add validations to Page, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {
      title: "foo",
      content: "bar",
      sort_order: 0
    }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PagesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "should return the page with sort_order 0 when no page is specifed" do
      page = Page.create! valid_attributes
      page2 = Page.create! title: "other page", content: "some content", sort_order: 1
      get :index, {locale: "en"}#, valid_session
      assigns(:page).title.should eq("foo")
    end
  end

  describe "GET show" do
    it "assigns the requested page as @page" do
      page = Page.create! valid_attributes
      get :show, {:page => page.to_param, locale: "en"}#, valid_session
      assigns(:page).should eq(page)
    end
  end

  describe "GET new" do
    it "assigns a new page as @page" do
      get :new, {locale: "en"}#, valid_session
      assigns(:page).should be_a_new(Page)
    end
  end

  describe "GET edit" do
    it "assigns the requested page as @page" do
      page = Page.create! valid_attributes
      get :edit, {:page => page.to_param, locale: "en"}#, valid_session
      assigns(:page).should eq(page)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Page" do
        expect {
          post :create, { page: valid_attributes, locale: "en"}#, valid_session
        }.to change(Page, :count).by(1)
      end

      it "assigns a newly created page as @page" do
        post :create, {page: valid_attributes, locale: "en"}#, valid_session
        assigns(:page).should be_a(Page)
        assigns(:page).should be_persisted
      end

      it "redirects to the created page" do
        post :create, {:page => valid_attributes, locale: "en"}#, valid_session
        response.should redirect_to(Page.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved page as @page" do
        # Trigger the behavior that occurs when invalid params are submitted
        Page.any_instance.stub(:save).and_return(false)
        post :create, {locale: "en", page: {}}#, valid_session
        assigns(:page).should be_a_new(Page)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Page.any_instance.stub(:save).and_return(false)
        post :create, {locale: "en", page: {}}, valid_session
        response.should render_template("new")
      end
    end
  end
#
#  describe "PUT update" do
#    describe "with valid params" do
#      it "updates the requested page" do
#        page = Page.create! valid_attributes
#        # Assuming there are no other pages in the database, this
#        # specifies that the Page created on the previous line
#        # receives the :update_attributes message with whatever params are
#        # submitted in the request.
#        Page.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
#        put :update, {:id => page.to_param, :page => {'these' => 'params'}}, valid_session
#      end
#
#      it "assigns the requested page as @page" do
#        page = Page.create! valid_attributes
#        put :update, {:id => page.to_param, :page => valid_attributes}, valid_session
#        assigns(:page).should eq(page)
#      end
#
#      it "redirects to the page" do
#        page = Page.create! valid_attributes
#        put :update, {:id => page.to_param, :page => valid_attributes}, valid_session
#        response.should redirect_to(page)
#      end
#    end
#
#    describe "with invalid params" do
#      it "assigns the page as @page" do
#        page = Page.create! valid_attributes
#        # Trigger the behavior that occurs when invalid params are submitted
#        Page.any_instance.stub(:save).and_return(false)
#        put :update, {:id => page.to_param, :page => {}}, valid_session
#        assigns(:page).should eq(page)
#      end
#
#      it "re-renders the 'edit' template" do
#        page = Page.create! valid_attributes
#        # Trigger the behavior that occurs when invalid params are submitted
#        Page.any_instance.stub(:save).and_return(false)
#        put :update, {:id => page.to_param, :page => {}}, valid_session
#        response.should render_template("edit")
#      end
#    end
#  end
#
#  describe "DELETE destroy" do
#    it "destroys the requested page" do
#      page = Page.create! valid_attributes
#      expect {
#        delete :destroy, {:id => page.to_param}, valid_session
#      }.to change(Page, :count).by(-1)
#    end
#
#    it "redirects to the pages list" do
#      page = Page.create! valid_attributes
#      delete :destroy, {:id => page.to_param}, valid_session
#      response.should redirect_to(pages_url)
#    end
#  end

end
