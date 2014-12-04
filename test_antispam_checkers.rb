require 'rubygems'
require 'bundler/setup'

require 'yandex_cleanweb'
require 'the_viking'

require_relative './api_keys'

puts '*' * 30
puts '# YANDEX CLEAN WEB'
puts '*' * 30

YandexCleanweb.api_key = CLEAN_WEB_API_KEY

puts YandexCleanweb.spam?("just phrase")
puts YandexCleanweb.spam?(ip: '217.129.152.5', email: 'kosmos-180@hotmail.com', name: 'Boomzoom', subject_html: 'Boomzoom', body_html: '<a href="http://www.seosprint.net/?ref=4448381" target="_blank"><img src="http://www.seosprint.net/baners/seo2x468x60.gif" width="468" height="60" border="0" alt="SEO sprint - Всё для максимальной раскрутки!" /></a>')

puts '*' * 30
puts '# AKISMET/THE_VIKING'
puts '*' * 30

vik = TheViking::Akismet.new(api_key: AKISMET_API_KEY, blog: WEB_SITE)

# Additional params
#
# referrer
# comment_author_url
# permalink - url of commented page
# comment_type - may be blank, comment, trackback, pingback, or a made up value like

puts vik.check_comment(
  user_ip: '217.129.152.5',
  user_agent: 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:33.0) Gecko/20100101 Firefox/33.0',
  comment_author: 'Boomzoom',
  comment_author_email: 'kosmos-180@hotmail.com',
  comment_content: '<a href="http://www.seosprint.net/?ref=4448381" target="_blank"><img src="http://www.seosprint.net/baners/seo2x468x60.gif" width="468" height="60" border="0" alt="SEO sprint - Всё для максимальной раскрутки!" /></a>'
)

puts vik.check_comment(
  user_ip: '91.122.40.97',
  user_agent: 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:33.0) Gecko/20100101 Firefox/33.0',
  comment_author: 'Ilya',
  comment_content: 'Hello honey! Looks very good!'
)
