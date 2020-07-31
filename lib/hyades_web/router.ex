defmodule HyadesWeb.Router do
  use HyadesWeb, :router
  use Pow.Phoenix.Router
  use Pow.Extension.Phoenix.Router, extensions: [PowResetPassword]

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :protected do
    plug Pow.Plug.RequireAuthenticated, error_handler: Pow.Phoenix.PlugErrorHandler
  end

  if Mix.env == :dev do
    forward "/sent_emails", Bamboo.SentEmailViewerPlug
  end

  scope "/" do
    pipe_through :browser
    pow_routes()
    pow_extension_routes()
  end

  scope "/", HyadesWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/contact", PageController, :contact
    get "/legal_notices", PageController, :legal_notices
    get "/conditions", PageController, :conditions
  end

  scope "/u", HyadesWeb do
    pipe_through [:browser, :protected]

    get "/", UserController, :landing
    get "/account", UserController, :account
    get "/last", UserController, :last_newsletter
    get "/billing", UserController, :billing
    delete "/delete", UserController, :delete
    # Github integration
    scope "/github" do
       get "/authorize", UserController, :github_register
       get "/back", UserController, :github_back
     end
     # Stripe integration
     scope "/subscribe" do
       ## Chose a plan
       get "/", UserController, :stripe_register
       ## Redirected there when payment succeeded
       get "/success/", UserController, :stripe_success
       ## Returns a subscription object
       get "/plan/:type", UserController, :stripe_plans
     end
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: HyadesWeb.Telemetry
    end
  end
end
