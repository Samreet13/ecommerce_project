Rails.application.routes.draw do
  devise_for :customers
  ActiveAdmin.routes(self)
  root "products#index"
end