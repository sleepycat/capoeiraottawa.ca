require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  setup do
    Redis.current = Redis.new(db: 13)
  end

  teardown do
    Redis.current.flushdb
  end

  test "should get show" do
    get :show, locale: "en", page: "foo"
    assert_not_nil assigns(:page)
  end
end

