Rails.application.routes.draw do
  resources :caferes
  resources :movieres
  resources :tickets
  resources :reservations

  get 'reservations/search/:reservation_number/', to: 'reservations#look_up_reservation'
  get 'movieres/search/:reservation_number/', to: 'movieres#look_up_reservation'
  get 'caferes/search/:reservation_number/', to: 'caferes#look_up_reservation'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
