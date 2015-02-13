require 'net/http'
autoload :EbayFindItem, "ebay_ruby/ebay_find_item"

class EbayConnect

  #@params global id should be US, DE, RU etc.
  def initialize(app_id, global_id='RU')
    @app_id = app_id
    @global_id = "EBAY-#{global_id.upcase}"
  end

  attr_reader :app_id, :build_uri

  def get_connect(url)
    response = Net::HTTP.get_response url
    response.body
  end

  def find_items_by_keywords(search_keyword, per_page)
    str = __method__.to_s.camelize
    operation_name = str.gsub(str.first, str.first.downcase)
    search_param = "keywords=#{URI::encode(search_keyword)}"
    ebay_items = EbayFindItem.new(get_connect(build_uri(operation_name, search_param, per_page)))
    ebay_items.all_items
  end

  def find_items_by_category(category_id, per_page)
    str = __method__.to_s.camelize
    operation_name = str.gsub(str.first, str.first.downcase)
    search_param = "categoryId=#{category_id}"
    ebay_items = EbayFindItem.new(get_connect(build_uri(operation_name, search_param, per_page)))
    ebay_items.all_items
  end
  #productId can be ISBN,UPC,EAN
  def find_items_by_product(product_id, per_page)
    str = __method__.to_s.camelize
    operation_name = str.gsub(str.first, str.first.downcase)
    search_param = "productId=#{product_id}"
    ebay_items = EbayFindItem.new(get_connect(build_uri(operation_name, search_param, per_page)))
    ebay_items.all_items
  end


  private
  def build_uri(operation_name, search_keyword, per_page)
    uri_string = "http://svcs.ebay.com/services/search/FindingService/v1?OPERATION-NAME=#{operation_name}&SERVICE-VERSION=1.0.0&SECURITY-APPNAME=#{app_id}&GLOBAL-ID=#{@global_id}&RESPONSE-DATA-FORMAT=JSON&#{search_keyword}&paginationInput.entriesPerPage=#{per_page.to_i}"
    URI(uri_string)
  end
 end
