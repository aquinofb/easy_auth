Rails.application.routes.draw do

  resources :users
  resources :vendedors
  resources :produtos

  namespace :teste do
    namespace :nivel do
      resources :full do
        collection do
          get :xxx
        end
      end
    end
  end

  mount EasyAuth::Engine => "/easy_auth"
end
