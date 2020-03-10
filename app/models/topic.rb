class Topic < ActiveRecord::Base
  has_many :comments
  # VALID_PASSWORD_REGEX = /\A[a-z\d]{0,10}+\z/i
  validates :title, presence: { message: "タイトルを入力してください" },length: { maximum: 20, message: "タイトルは２０文字までです" }
  validates :name, length: { maximum: 10, message: "名前は１０文字までです" }
  # validates :password, format: { with:VALID_PASSWORD_REGEX,mesage:"パスワードは10文字以下の半角英数です"},presence: { message: "パスワードを入力してください" }
  # validates :category, presence: { message: "カテゴリーを入力してください" }
  validates :text, presence: { message: "本文を入力してください" },length: { maximum: 2000, message: "本文は2000文字までです" }
  validates :yoron1, presence: { message: "Yoron1を入力してください" },length: { maximum: 15, message: "Yoronは15文字までです" }
  validates :yoron2, presence: { message: "Yoron2を入力してください" },length: { maximum: 15, message: "Yoronは15文字までです" }
  validates :yoron3, length: { maximum: 15, message: "Yoronは15文字までです" }
  validates :yoron4, length: { maximum: 15, message: "Yoronは15文字までです" }
  validates :yoron5, length: { maximum: 15, message: "Yoronは15文字までです" }
  validates :yoron6, length: { maximum: 15, message: "Yoronは15文字までです" }
  validates :yoron7, length: { maximum: 15, message: "Yoronは15文字までです" }
  validates :yoron4, yoron: true
  validates :yoron5, yoron: true
  validates :yoron6, yoron: true
end
