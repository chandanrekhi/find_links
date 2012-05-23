#!/usr/bin/env ruby

require 'rubygems'
require 'twitter'


# Please check that the hash symbol is prefixed to a hashtag.

def hashtag(tag_to_search)
  (tag_to_search.scan(/^#/).empty?) ? "##{tag_to_search}" : tag_to_search
end

# Search the tweets with the particular hashtag
def tweets_search(tag_to_search)
  Twitter.search(tag_to_search, :rpp => 100, result_type: 'recent')
end

# Return a sorted list of unique links found in the list of tweets.
def links(tweet_urls)
  tweet_urls.map(&:text).grep( %r{http://}i ).to_s.scan( Regexp.new %r{http://[\w/.%-]+}i ).uniq
end

# Displays message with correct format for appropriate usage of the application and does not let the application throw an exception.
def implement
  puts "How to use:-> ruby #{File.basename $0} aHashtag"
  exit
end


if __FILE__ == $0
begin
  implement unless ARGV.size >= 1
  tag_to_search = hashtag(ARGV[0])
  tweet_urls = tweets_search(tag_to_search)
  puts links(tweet_urls)
rescue
	puts "*** Please enter a valid hashtag option ***\n"
	implement
	exit
end
end
