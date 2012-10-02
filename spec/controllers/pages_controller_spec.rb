require 'spec_helper'

describe PagesController do

  def valid_session
    user = FactoryGirl.create(:user)
    ApplicationController.any_instance.stub(:current_user).and_return(user)
    {"user_id" => user.id}
  end

  def valid_attributes
    {
      title: "foo",
      content: "bar",
      sort_order: 0
    }
  end

  describe "GET index" do

    context "when no pages exist" do

      it "returns a default page" do
        get(:index, {locale: "en"}, valid_session)
        assigns(:page).title.should eq("change_me")
      end

    end

    context "when at least two pages have been created" do
      context "and no page has been specified" do
        before :each do
          @right_page = FactoryGirl.create :page
          @wrong_page = FactoryGirl.create :page, title: "bad", content: "wrong", sort_order: 100
        end

        it "returns the page with lowest sort_order when no page is specifed" do
          get(:index, {locale: "en"}, valid_session)
          assigns(:page).should eq(@right_page)
        end
      end
    end
  end

  describe "GET show" do

    it "gets the requested page" do
      page = FactoryGirl.create(:page)
      get :show, {:page => page.title, locale: "en"}, valid_session
      assigns(:page).should eq(page)
    end

    it "renders a 404 for unknown pages" do
      get :show, {:page => "non_existant_page", locale: "en"}, valid_session
      response.status.should == 404
    end

  end

  describe "GET new" do

    it "assigns a new page" do
      get :new, {locale: "en"}, valid_session
      assigns(:page).should be_a_new(Page)
    end

  end

  describe "GET edit" do
    let(:page){ FactoryGirl.create(:page) }

    context "with a valid session" do
      it "assigns the requested page as @page" do
        get :edit, {:page => page.title, locale: "en"}, valid_session
        assigns(:page).title.should eq(page.title)
      end
    end

    context "with an invalid session" do

      before(:each){ get(:edit, {:page => page.title, locale: "en"}, {}) }

      it "redirects" do
        response.should redirect_to login_path
      end

      it "sets a flash message" do
        flash[:notice].should include("not authorized")
      end

    end

  end

  describe "POST create" do
    context "with a valid session" do
      describe "with valid params" do
        it "creates a new Page" do
          expect {
            post :create, { page: valid_attributes, locale: "en"}, valid_session
          }.to change(Page, :count).by(1)
        end

        it "assigns a newly created page as @page" do
          post :create, {page: valid_attributes, locale: "en"}, valid_session
          assigns(:page).should be_a(Page)
          assigns(:page).should be_persisted
        end

        it "redirects to the created page" do
          post :create, {:page => valid_attributes, locale: "en"}, valid_session
          response.should redirect_to(Page.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved page as @page" do
          # Trigger the behavior that occurs when invalid params are submitted
          Page.any_instance.stub(:save).and_return(false)
          post :create, {locale: "en", page: {}}, valid_session
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
    context "with an invalid session" do

      before(:each){ post(:create, {:page => valid_attributes, locale: "en"}, {}) }

      it "redirects" do
        response.should redirect_to login_path
      end

      it "sets a flash message" do
        flash[:notice].should include("not authorized")
      end

    end
  end

  describe "PUT update" do
    context "with a valid session" do
      describe "with valid params" do
        it "updates the requested page" do
          page = Page.create! valid_attributes
          Page.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, {page_title: page.to_param, page: {'these' => 'params'}, locale: "en"}, valid_session
        end

        it "assigns the requested page as @page" do
          page = Page.create! valid_attributes
          put :update, {page_title: page.to_param, page: valid_attributes, locale: "en"}, valid_session
          assigns(:page).should eq(page)
        end

        it "redirects to the page" do
          page = Page.create! valid_attributes
          put :update, {page_title: page.to_param, page: valid_attributes, locale: "en"}, valid_session
          response.should redirect_to(page)
        end
      end

      describe "with invalid params" do
        it "assigns the page as @page" do
          page = Page.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Page.any_instance.stub(:save).and_return(false)
          put :update, {page_title: page.to_param, page: {}, locale: "en"}, valid_session
          assigns(:page).should eq(page)
        end

        it "re-renders the 'edit' template" do
          page = Page.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Page.any_instance.stub(:save).and_return(false)
          put :update, {page_title: page.to_param, page: {}, locale: "en"}, valid_session
          response.should render_template("edit")
        end
      end
    end

    context "with an invalid session" do

      before(:each){ put(:update, {:page_title => "foo", locale: "en"}, {}) }

      it "redirects" do
        response.should redirect_to login_path
      end

      it "sets a flash message" do
        flash[:notice].should include("not authorized")
      end

    end
  end

  describe "DELETE destroy" do
    context "with a valid session" do
      it "destroys the requested page" do
        page = Page.create! valid_attributes
        expect {
          delete :destroy, {page: page.to_param, locale: "en"}, valid_session
        }.to change(Page, :count).by(-1)
      end

      it "redirects to the pages list" do
        page = Page.create! valid_attributes
        delete :destroy, {page: page.to_param, locale: "en"}, valid_session
        response.should redirect_to(index_page_path)
      end
    end

    context "with an invalid session" do

      before(:each){ delete(:destroy, {:page => "foo", locale: "en"}, {}) }

      it "redirects" do
        response.should redirect_to login_path
      end

      it "sets a flash message" do
        flash[:notice].should include("not authorized")
      end

    end
  end

end
