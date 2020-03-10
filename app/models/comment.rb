class Comment < ActiveRecord::Base
  belongs_to :topic
  validates :name, length: { maximum: 10, message: "名前は１０文字までです" }

  validates :text, presence: { message: "本文を入力してください" },length: { maximum: 500, message: "本文は500文字までです" }

end
