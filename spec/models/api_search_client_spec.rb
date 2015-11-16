require 'rails_helper'

describe ApiSearchClient do
  describe '.total_count_of_filtered_items' do

    it 'returns a length of items' do
    

      response = ApiSearchClient.total_count_of_filtered_items
      expect(response).to be > 0
    end
  end
  
  describe '.request_items' do  
    before(:each) do
      @items = ApiSearchClient.request_items 0
    end
    it 'returns a list of items' do

      response = @items

      expect(response).to_not be_nil
    end

    it 'returns itmes in newest items first order' do
      response = @items
      expect(response[0]['created_at'].to_date).to be > response[1]['created_at'].to_date
    end

    it 'url of the items must contains “github”' do
      @items.each do |response|
        
        expect(response['url']).to include( 'github' )
      end
    end

    it 'url of the items must contains “github”' do
      @items.each do |response|
        
        expect(response['points']).to be > 1000
      end
    end

  end


end