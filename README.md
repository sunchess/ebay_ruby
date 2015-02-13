# EbayRuby

Ebay access finding API with getting all items.

<img src="https://badge.fury.io/rb/ebay_ruby.svg" alt="Gem Version" />
## Installation

Add this line to your application's Gemfile:

    gem 'ebay_ruby', github: 'sunchess/ebay_ruby'

And then execute:

    $ bundle

## Usage

Find your App Id on ebay Account

     require 'ebay_ruby'
     c = EbayConnect.new("YOURAPPID", "DE")

Second argument is eBay GLOBAL-ID

Send two arguments keyword, number of entry per page

     items = c.find_items_by_keywords("Harry Potter", 3)
     items = c.find_items_by_category("CATEGORY_ID", 3)
     items  = c.find_items_by_product("ISBN/UPC/EAN", 3)
     item = items.first
     item.title
     item.globalId
     item.primaryCategory #to get categoryid and name [{"categoryId"=>["2444"], "categoryName"=>["Vintage"]}]
     item.galleryURL # to get gallery url
     item.viewItemURL #to get the original ebay url
     item.paymentMethod
     item.postalCode
     item.location
     item.country
     item.shippingInfo
     item.shipToLocations
     item.sellingStatus # it return current market price with currency [{"currentPrice"=>[{"@currencyId"=>"USD", "__value__"=>"10.0"}], "convertedCurrentPrice"=>[{"@currencyId"=>"USD", "__value__"=>"10.0"}], "bidCount"=>["0"], "sellingState"=>["Active"], "timeLeft"=>["P0DT1H41M35S"]}]


     item.listingInfo #[{"bestOfferEnabled"=>["false"], "buyItNowAvailable"=>["false"], "startTime"=>["2014-06-07T08:16:46.000Z"], "endTime"=>["2014-06-10T08:16:46.000Z"], "listingType"=>["Auction"], "gift"=>["false"]}]
     item.topRatedListing
    ...
   So on



## Contributing

1. Fork it ( https://github.com/rajcybage/ebay_ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
