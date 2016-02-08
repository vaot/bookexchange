require 'elasticsearch/model'
require 'elasticsearch/transport'

ELASTICSEARCH_OPTIONS = {
  log: true,
  hosts: [
    {
      host: (ENV["ELASTICSEARCH_PORT_9200_TCP_ADDR"] || "localhost"),
      port: (ENV["ELASTICSEARCH_PORT_9200_TCP_PORT"] || "9200")
    }
  ]
}

Elasticsearch::Model.client = Elasticsearch::Client.new(ELASTICSEARCH_OPTIONS)
