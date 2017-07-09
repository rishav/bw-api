Rails.application.routes.draw do
  post '/email' => 'bright_wheel_emails#create', as: :post_email

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
