require 'httparty'
class ApiSearchClient

  def self.total_count_of_filtered_items
    begin 
      response = HTTParty.get('http://hn.algolia.com/api/v1/search_by_date?tags=story&query=github&restrictSearchableAttributes=url&numericFilters=points>1000')
      response['hits'].size
    rescue => e
      0
    end
  end


  def self.request_items page
    begin
      response = HTTParty.get("http://hn.algolia.com/api/v1/search_by_date?tags=story&query=github&restrictSearchableAttributes=url&numericFilters=points>1000&hitsPerPage=5&page=#{page}")
      response['hits']
    rescue => e
      []
    end
  end

end