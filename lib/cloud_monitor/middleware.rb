module CloudMonitor
  mattr_accessor :mute_regexp
  self.mute_regexp = nil

  def self.mute!
    Thread.current["metrics.mute"] = true
    yield
  ensure
    Thread.current["metrics.mute"] = false
  end

  def self.mute?
    Thread.current["metrics.mute"] || false
  end

  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      if CloudMonitor.mute_regexp && env["PATH_INFO"] =~ CloudMonitor.mute_regexp
        CloudMonitor.mute!{ @app.call(env) }
      else
        @app.call(env)
      end
    end
  end
end
