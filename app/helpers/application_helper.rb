module ApplicationHelper
def full_title(page_title)
    base_title = "Yoron!" # 自分のアプリ名を設定する
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
  def full_h1(page_title)
    base_title = "Yoron" # 自分のアプリ名を設定する
    if page_title.empty?
      base_title
    else
      "#{page_title}"
    end
  end
end
