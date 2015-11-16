class HnSearchController < ApplicationController
  # GET hn_search/items
  def items
    @items_total_count = get_items_memoized_length
    @total_pages       = (@items_total_count / 5).ceil
    @items = ApiSearchClient.request_items params[:page] || 0
  end

  protected
 
  #to avoid extra hits to hn search api
  def get_items_memoized_length
    params[:total_items].present? ? params[:total_items].to_i : ApiSearchClient.total_count_of_filtered_items
  end  
end
