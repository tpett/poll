Poll::Application.routes.draw do
  root to: "questions#index"
  resources :questions
  resources :responses
end
