require_relative 'lib/appsignal_exporter/version'

Gem::Specification.new do |s|
  s.name        = 'appsignal-exporter'
  s.version     = AppsignalExporter::VERSION
  s.date        = '2019-02-21'
  s.summary     = "Exporter for the AppSignal platform"
  s.description = "Exporter for the AppSignal platform"
  s.authors     = ["Clemens Kofler"]
  s.email       = 'clemens.kofler@temedica.com'
  s.executables = ['appsignal-exporter']
  s.files       = `git ls-files -z`.split("\0")
  s.homepage    = 'https://github.com/temedica/appsignal-exporter'
  s.license     = 'MIT'

  s.add_dependency 'rest-client'
end
