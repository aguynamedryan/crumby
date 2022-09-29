# frozen_string_literal: true

require_relative "crumby/version"
require "ruby-curl"
require 'sinatra/base'

module Crumby
  class Error < StandardError; end
  
  class Passer
    attr_reader :url

    def initialize(url)
      @url = url
    end

    def yacy_url
      "http://yacy.jenandryanmakeitso.com/Crawler_p.html?indexText=on&indexMedia=on&crawlingstart=Neuen%20Crawl%20starten&crawlingDepth=0&crawlingMode=url&crawlingIfOlderUnit=day&crawlingIfOlderCheck=on&crawlingIfOlderNumber=1&crawlingURL=#{url}"
    end

    def pass_it_on
      curl = Curl::Easy.new
      curl.setopt(Curl::Opt::URL, yacy_url)
      curl.setopt(Curl::Opt::USERPWD, "admin:yacy")
      curl.setopt(Curl::Opt::HTTPAUTH, Curl::Auth::DIGEST)
      res = curl.perform
      curl.cleanup
      res
    end
  end

  class MyApp < Sinatra::Base
    get '/' do
      case Passer.new(params["url"]).pass_it_on
      when 0
        return 200
      else
        return 500
      end
    end
  end
end