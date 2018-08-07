Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do 
      resources :articles
      resources :identities
      resources :values
      resources :teammembers
    end
  end
end
