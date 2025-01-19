Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  # Mount the API routes at api subdomain
  constraints subdomain: "api" do
    namespace :v1, defaults: { format: :json_v1 } do
      resources :tenants, only: [ :index, :show ] do
        post :check, to: "tenants#check_subdomain", on: :collection
      end
    end

    # constraints ->(request) { RoutingConstraint.dell_engine?(request) } do
    #   mount Dell::Engine, at: '/', as: :api_dell
    # end

    # mount Core::Engine, at: '/', as: :api_core
  end

  # Mounts the core engine routes at the root path
  constraints subdomain: /.+/ do
    mount Core::Engine => '/'

    # Mount the core engine at the root path
    # mount Track::Engine, at: "/track"
    # mount Trail::Engine, at: "/trail"
    # mount Trace::Engine, at: "/trace"
  end
end
