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
end
