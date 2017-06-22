require_relative 'lib/appsignal_exporter/version'

Gem::Specification.new do |s|
  s.name        = 'appsignal-exporter'
  s.version     = AppsignalExporter::VERSION
  s.date        = '2017-06-22'
  s.summary     = "Exporter for the AppSignal platform"
  s.description = "Exporter for the AppSignal platform"
  s.authors     = ["Clemens Kofler"]
  s.email       = 'clemens.kofler@physiovia.com'
  s.executables = ['appsignal-exporter']
  s.files       = `git ls-files -z`.split("\0")
  s.homepage    = 'https://github.com/physiovia/appsignal-exporter'
  s.license     = 'MIT'

  s.add_dependency 'rest-client'
end
