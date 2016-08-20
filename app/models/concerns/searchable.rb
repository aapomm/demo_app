module Searchable

  def self.included base
    base.module_eval do
      include Elasticsearch::Model
      include Elasticsearch::Model::Callbacks
      include Elasticsearch::Model::Indexing

      extend ClassMethods

      settings self.elasticsearch_settings do
        mappings :dynamic => 'false' do
          indexes :full_name, :analyzer => :ngram_analyzer
        end
      end

      after_touch do
        self.__elasticsearch__.index_document
      end
    end
  end



  module ClassMethods

    def elasticsearch_settings
      @elasticsearch_settings ||=
        YAML.load_file("config/elasticsearch.yml").with_indifferent_access
    end

    def query_from_tokens tokens
      tokens.map { |token| "full_name:#{token}" }.join(' OR ')
    end

    def fulltext_search query
      tokens = query.split /\s+/
      formatted_query = query_from_tokens tokens

      self.search formatted_query
    end

  end

end
