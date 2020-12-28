require "open-uri"
def fetch_page(url)
  return open(url).read
end

def count_tags(page, tag)
  pattern = /<#{tag}\b/
  tags = page.scan(pattern)
  return tags.length
end

sites = ["http://www.yandex.ru", "http://www.kinopoisk.ru", "http://www.vc.ru"]
tags = ["div", "h1", "h2", "h3", "img", "p"]

sites.each do |url|
  puts "#{url} has:"
  tags.each do |tag|
    page = fetch_page(url)
    tag_count = count_tags(page, tag)
    puts "\t - #{tag_count} <#{tag}> tags"
  end
end