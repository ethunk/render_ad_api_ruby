require "sinatra"
require 'pry'
require 'json'
require 'rest-client'
require 'rubygems'
require "sinatra/config_file"
require 'rest-client'
require 'screencap'
require 'webshot'

config_file 'path/to/config.yml'
@screenshot = Screencap::Fetcher.new('http://localhost:4567/test')

set :bind, '0.0.0.0'  # bind to all interfaces
use Rack::Session::Cookie, {
  expire_after: 20
}


get "/variables" do
  erb :index
end

get "/template" do
  erb :template, :locals => {:variables => @params}
end

get "/base" do
  erb :base
end

get "/test_aaron" do
  @params = {
      'creative_uuid': 'http://image.email-orvis.com/lib/fe8b13727662037f7c/m/7/cb607085-262b-4c5a-b048-759aab3e6769.jpg',
      'landing_page_url': 'http://www.orvis.com/mens-shirts',
      'alt_text': '&quot;This is the kind of shirt you could wear every day and do anything.&quot; —ORVIS CUSTOMER',
      'headline': 'TECHNICAL PERFORMANCE WITH CASUAL STYLE',
      'body_copy': 'Our ever-popular Tech Chambray Work Shirt boasts mechanical stretch and quick-dry fabric. Styled like an authentic chambray work shirt, it&#x27;s ideal for work days, fishing days, and every day in between.',
      'call_to_action': 'SHOP SHIRTS',
      'use_promotional_cta': false,
  }
  binding.pry
  erb :post_template_aaron
end

get "/test" do
  erb :test
end

get "/test_img" do
  erb :test_img_png
end

post '/api/post_template' do
  # content_type 'application/json'
  x = erb(:post_template, :locals => {:variables => @params})
  File.write('views/test.erb', x)
  x #last line has to be the return value
end

post '/api/post_template_aaron' do
  # content_type 'application/json'
  x = erb(:post_template_aaron, :locals => {:variables => @params})
  File.write('views/test.erb', x)
  x
  # @screenshot = Webshot::Screenshot.instance
  # @screenshot.capture('http://localhost:4567/test', '/views/test_img_png.erb', width: 800, height: 300)
end

#this URL is for passing data directly through the url address, a workaround using a post and instead using a GET
get '/api/variables/:data' do
  content_type 'application/json'
  erb :template, :locals => {:variables => @params}
end
