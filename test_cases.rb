require 'pg'
require 'csv'
require 'pry'
require 'rest-client'
require 'screencap'
require_relative 'app.rb'
data = []
CSV.foreach('sample_test_data.csv', headers: true) do |row|
  data << row.to_hash
end

sample_payload = {
    'creative_uuid': 'http://image.email-orvis.com/lib/fe8b13727662037f7c/m/7/cb607085-262b-4c5a-b048-759aab3e6769.jpg',
    'landing_page_url': 'http://www.orvis.com/mens-shirts',
    'alt_text': '&quot;This is the kind of shirt you could wear every day and do anything.&quot; —ORVIS CUSTOMER',
    'headline': 'TECHNICAL PERFORMANCE WITH CASUAL STYLE',
    'body_copy': 'Our ever-popular Tech Chambray Work Shirt boasts mechanical stretch and quick-dry fabric. Styled like an authentic chambray work shirt, it&#x27;s ideal for work days, fishing days, and every day in between.',
    'call_to_action': 'SHOP SHIRTS',
    'use_promotional_cta': false,
} #cannot capitalize 'False', must be 'false'


binding.pry
data_0 = RestClient.post('http://localhost:4567/api/post_template', data[0])
data_1 = RestClient.post('http://localhost:4567/api/post_template', data[1])
data_2 = RestClient.post('http://localhost:4567/api/post_template', data[2])
data_3 = RestClient.post('http://localhost:4567/api/post_template', data[3])

payload_0 = RestClient.post('http://localhost:4567/api/post_template_aaron', sample_payload)
# File.write('views/test.html', store.body)
