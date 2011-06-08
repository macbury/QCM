module CloudMonitor
  class Engine < Rails::Engine
    config.app_middleware.insert_after "ActionDispatch::Callbacks", "CloudMonitor::Middleware"
    config.metrics = CloudMonitor
  end
end

