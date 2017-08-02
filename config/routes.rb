Rails.application.routes.draw do
  root to: 'phrases#index'
  get 'random_phrase', to: "phrases#random"
end
