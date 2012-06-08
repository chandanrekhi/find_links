#!/usr/bin/env ruby

require 'rubygems'
require 'twitter'

class Findlinks
  
# Please check that the hash symbol is prefixed to a hashtag.

  def hashtag(tag_to_search)
    if tag_to_search.start_with?('#') 
      tag_to_search 
    else 
      "##{tag_to_search}" 
    end
  end

# Search the tweets with the particular hashtag
  def tweets_search(tag_to_search)
    Twitter.search(tag_to_search, :rpp => 100, :result_type => 'recent')
  end

# Return a sorted list of unique links found in the list of tweets.
  def links(tweet_urls)
    tweet_urls.map{|tweet_url| URI.extract(tweet_url.text, 'http' )}.uniq
  end
   
# Displays message with correct format for appropriate usage of the application and does not let the application throw an exception.
  def implement
    puts "How to use:-> ruby #{File.basename $0} aHashtag"
    exit
  end

  result = Findlinks.new

  begin
    implement unless ARGV.size >= 1
    tag_to_search = result.hashtag(ARGV[0])
    tweet_urls = result.tweets_search(tag_to_search)
    puts result.links(tweet_urls)
  rescue
	  puts "*** Please enter a valid hashtag option ***\n"
	  exit
  end
end
