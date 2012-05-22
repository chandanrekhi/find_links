#!/usr/bin/env ruby

require_relative 'find_links'
require 'minitest/autorun'

describe 'hashtag' do
  it 'should prepend a # to strings when needed' do
      hashtag('#abc').must_equal '#abc' 
  end
end

describe 'links' do
    
  it 'should not raise errors when no tweets with links are found' do
    links( [] ).size.must_equal 0
  end
end
