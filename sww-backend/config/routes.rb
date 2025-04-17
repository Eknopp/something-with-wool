Rails.application.routes.draw do
  devise_for :users, path: "", path_names: {
                                 sign_in: "login",
                                 sign_out: "logout",
                                 registration: "signup"
                               },
    controllers: {
      sessions: "v1/users/sessions",
      registrations: "v1/users/registrations"
    }

  namespace :v1 do
    resources :patterns do
      member do
        patch :archive
      end
    end

    resources :projects
    resources :yarns
  end
end
