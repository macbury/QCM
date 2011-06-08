require 'active_support/notifications'
require 'cloud_monitor/middleware'
require 'cloud_monitor/engine'

ActiveSupport::Notifications.subscribe do |*args|
  CloudMonitor.store!(args) unless CloudMonitor.mute?
end

module CloudMonitor
  Config = Yaml.load(File.read("#{Rails.root}/config/cloud_monitor.yml")).symbolize_keys
  @store = []
  def self.path
    File.expand_path('../..', __FILE__)
  end

  def self.store!(*args)
    @store << args
    
  end
end

