require 'rest-client'
require 'json'
require 'pathname'
require 'date'

class AppsignalExporter
  def initialize(api_key, app_id)
    @api_key = api_key
    @app_id = app_id
    @output_path = Pathname.new("appsignal-export-#{Date.today.strftime('%Y-%m-%d')}")
  end

  def export_errors(params = {})
    params = parse_params(params)
    @output_path.mkpath

    output_file = @output_path.join('errors.json')
    return if output_file.exist?

    error_samples_response = get('samples/errors', params)

    output_file.write(error_samples_response)

    error_samples_response['log_entries'].each do |entry|
      next if (output_file = @output_path.join("#{entry['id']}.json")).exist?

      error_sample_response = get("samples/#{entry['id']}")
      output_file.write(error_sample_response)
    end
  end

  private

  def get(path, params = {})
    query_string = params.merge(token: @api_key).map { |key, value| "#{key}=#{value}" }.join('&')
    JSON.parse(RestClient.get("https://appsignal.com/api/#{@app_id}/#{path}.json?#{query_string}"))
  end

  def parse_params(params)
    params[:since] = Time.utc(*params[:since].split(/\D/).map(&:to_i)).to_i if params.key?(:since)
    params[:before] = Time.utc(*params[:before].split(/\D/).map(&:to_i)).to_i if params.key?(:before)
    params
  end

end

require_relative 'appsignal_exporter/version'
