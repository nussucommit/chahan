Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :bookings

  resources :email_templates do
    collection do
      get 'select', to: 'email_templates#select'
    end

    member do
      get 'adapt', to: 'email_templates#adapt'
      post 'adapt', to: 'email_templates#notify'
    end
  end

  root 'bookings#index'
end
