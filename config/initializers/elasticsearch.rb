require 'elasticsearch/model'
require 'elasticsearch/transport'

ELASTICSEARCH_OPTIONS = {
  log: true,
  host: ENV["ELASTICSEARCH_PORT"] || "localhost:9200"
}

Elasticsearch::Model.client = Elasticsearch::Client.new(ELASTICSEARCH_OPTIONS)
