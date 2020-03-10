Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'topics#index'
  resources :topics do
    resources :comments
  end
  # resources :posts
  get 'topics' => 'topics#index'
  post 'comment' => 'topics#comment'
  get 'aftercomment' => 'topics#aftercomment'
  get 'search' => 'topics#search'
  get 'admin' => 'topics#admin'

  get 'newpost' => 'topics#newpost'
  get 'categorys' => 'topics#categorys'
  get 'topicposted' => 'topics#topicposted' # トピックの新規投稿後に飛ぶページ
  get 'contact' => 'topics#contact'
  get 'aftercontact' => 'topics#aftercontact'
  get 'agreement' => 'topics#agreement'
end
