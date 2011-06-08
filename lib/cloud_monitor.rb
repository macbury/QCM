require 'active_support/notifications'
require 'cloud_monitor/middleware'
require 'cloud_monitor/engine'
require "yaml"

ActiveSupport::Notifications.subscribe do |*args|
  CloudMonitor.store!(args) unless CloudMonitor.mute?
end

module CloudMonitor
  #Config = YAML.load(File.read("#{Rails.root}/config/cloud_monitor.yml")).symbolize_keys
  @store = []
  def self.path
    File.expand_path('../..', __FILE__)
  end

  def self.store!(*args)
    @store << args
    file_name = File.join([Rails.root, 'log', 'monitor', (Time.new.to_f * 100000).to_i.to_s(16).upcase+".cm"])
    File.open(file_name, 'w') {|f| f.write(args.to_yaml) }
  end
end

