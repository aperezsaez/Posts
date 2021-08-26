Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  post 'posts/create', as: 'posts'
  post 'posts/repost/:id', to: 'posts#repost', as: 'repost'
  get 'likes/:id', to: 'likes#to_like', as: 'like'
  delete 'likes/:id', to: 'likes#to_dislike', as: 'dislike'
  get 'posts/likes/:id', to: 'posts#show', as: 'post_detail'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
