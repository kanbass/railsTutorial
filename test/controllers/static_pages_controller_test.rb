require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  # 「各」テストの実施前に実行される
  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  # 「各」テストの実行後に呼ばれる
  def teardown
    # コントローラがキャッシュを使っている場合、テスト後にリセットしておくとよい
    Rails.cache.clear
  end

  test "should get root" do
    get root_url
    assert_response :success
    assert_select "title", @base_title
  end

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", @base_title
  end

  test "should get help" do
    get helf_path
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end
end
