Rails.application.routes.draw do
  resources :events do
    get :status, on: :collection
  end
  root to: "events#index"
end

