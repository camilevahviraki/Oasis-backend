# Searchkick.client = Elasticsearch::Client.new(hosts: ["127.0.0.1:9200"], retry_on_failure: true, transport_options: {request: {timeout: 500}})

Searchkick.client_options = {
    url: 'http://localhost:9200',
    retry_on_failure: true,
    transport_options:
      { request: { timeout: 250 } }
  }

# Elasticsearch::Item.client = Elasticsearch::Client.new url: url
# Searchkick.client = Elasticsearch::Client.new(hosts: url, retry_on_failure: true, transport_options: {request: {timeout: 250}})