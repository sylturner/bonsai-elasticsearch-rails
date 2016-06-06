require 'elasticsearch/model'
require 'elasticsearch/rails'

Rails.logger = Logger.new(STDOUT) if Rails.logger.nil?
url    = ENV['BONSAI_URL'] || ENV['ELASTICSEARCH_URL']

unless url.nil?
  url_safe = url.gsub(/\:[a-z0-9]{1,}@/, ":redacted@")
  Rails.logger.info("Starting up a new Bonsai Elasticsearch client with url: #{url_safe}")
  Elasticsearch::Model.client = Elasticsearch::Client.new url: url
else
  Rails.logger.warn('Could not find a `BONSAI_URL` environment variable with a cluster URL. The bonsai-elasticsearch-rails can not create an Elasticsearch client. Please contact support at: support@bonsai.io')
end
