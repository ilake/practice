# http://rubydoc.info/gems/elasticsearch-api/Elasticsearch/API/Actions
require 'elasticsearch'
require 'hashie'

class Post < Struct.new(:id, :title, :context, :score)
  INDEX_NAME = 'posts'
  INDEX_TYPE = 'post'

  Client = Elasticsearch::Client.new host: 'localhost:9200'

  # mappings do
  #   indexes :title
  #   indexes :context
  #   indexes :score, :type => :float
  # end

  def self.mappings
    Client.indices.create :index => INDEX_NAME, :body => {
      :mappings => {
        INDEX_TYPE => {
          :properties => {
            :title => {
              :type => 'string',
            },
            :context => {
              :type => 'string'
            },
            :score => {
              :type => 'float'
            }
          }
        }
      }
    }
  end

  def self.rebuild_index
    clean_index
    build_index
  end

  def self.clean_index
    query.each do |post_document|
      Client.delete :index => INDEX_NAME, :type => INDEX_TYPE, :id => post_document.context.gsub(/context-/, '').to_i
    end
  end

  def self.build_index
    10.times.map { Random.rand(10) }.each do |number|
      Post.new(number, "title-#{number}", "context-#{number}", number).build_index
    end
  end

  def build_index
    Client.index :index => INDEX_NAME, :type => INDEX_TYPE,
                      :id => id, :body => as_indexed_json
  end

  def as_indexed_json
    {
      :id => id,
      :title => title,
      :context => context,
      :score => score
    }
  end

  def self.result(rsp)
    Hashie::Mash.new(rsp).hits.hits.map(&:_source)
  end

  # Experiement
  def self.query
    result ( Client.search :index => INDEX_NAME )
  end

  def self.facet
    Client.search :index => INDEX_NAME,
      :body => {
        :aggs => {
          :score_stats => {"stats" => { "field" => "score"} },
          :score_outlier => {"percentiles" => { "field" => "score", "percents" => [25, 50, 75]} },
          :score => {"terms" => { "field" => "score" } }
        }
      }
  end

  def self.search(options = {})
    r = {:index => INDEX_NAME}.merge(options)
    Client.search r
  end

  def self.match
     search :body => { :query => { :match => {:id => 6} }}
  end

  def self.multi_match
    search :body => { :query => {
                        :multi_match => {
                            :query => 6,
                            'fields' => ['title', 'context']
                          }
                        }
                      }
  end

  def self.bool
    search :body => { :query => {
                        :bool => {
                            'must' => { 'term' => { :id => 6}}
                          }
                        }
                      }
  end

  def self.should
    search :body => { :query => {
                        :bool => {
                            'should' => { 'term' => { :title => /title*/}}
                          }
                        }
                      }
  end


end
