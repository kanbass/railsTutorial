#カスタムヘルパー
#Railsのビューでは膨大な数の組み込み関数が使えますが、それだけでなく、新しく作成することもできます。
module ApplicationHelper
  # ページごとの完全なタイトルを返します。
  def full_title(page_title = "")
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
