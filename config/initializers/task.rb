#!/bin/env ruby  
# encoding: utf-8
# require 'rubygems'
require 'nokogiri'
require 'rest-client'
require 'mini_magick'
require 'timeout'
require 'rufus/scheduler'
scheduler = Rufus::Scheduler.new

scheduler.every("10m") do

  Timeout.timeout(3) do
    begin
      execFetch
    rescue Exception => e
      puts e
    end
  end

end

def execFetch

  html = RestClient.get("http://jandan.net")
  doc = Nokogiri::HTML(html)

  doc.css('.hotcomment')[0].css('.acv_comment').each do |ac|
    if ac.css('img')[0]
      img = MiniMagick::Image.open(ac.css('img')[0]['src'])
      Image.create(
        img_src: ac.css('img')[0]['src'],
        acv_comment: ac.content,
        width: img[:width],
        height: img[:height],
        size: img[:size])
    end
  end
end
