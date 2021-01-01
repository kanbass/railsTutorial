Rails.application.routes.draw do
  root "static_pages#home"
  get "/help", to: "static_pages#help", as: "helf" #asオプションを使うとhelf_pathという名前でパスを取得する事ができる
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "/signup", to: "users#new"
end
