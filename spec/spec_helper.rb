$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "virtus/matchers/rspec"
require "pry-byebug"
require "pathname"
require "active_support/core_ext/hash/indifferent_access"
require "active_support/json"
require "vcr"
require "stellar_client"

SPEC_DIR = Pathname.new(File.dirname(__FILE__))
CONFIG_YML = SPEC_DIR.join("config.yml")
CONFIG = YAML.load_file(CONFIG_YML).with_indifferent_access

StellarClient.configure do |c|
  c.bridge_host = CONFIG[:bridge_host]
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  %i[source destination].each do |var|
    c.filter_sensitive_data("[#{var}]") { CONFIG[var] }
  end
end
