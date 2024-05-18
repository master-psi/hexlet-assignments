# frozen_string_literal: true

require 'uri'
require 'forwardable'

class Url

  extend Forwardable
  include Comparable

  attr_reader :data

  def_delegators :@url, :scheme, :host, :port  

  def initialize(url)
    @url = URI(url)
    @params = params
    @data = {
      scheme: scheme,
      host: host,
      port: port,
      params: @params
    }
  end

  def query_params
    @params
  end

  def query_param(key, value = nil)
    @params.key?(key) ? @params[key] : value
  end

  def <=>(other)
   data <=> other.data
  end

  private

  def params
    params = {}
    unless @url.query.nil?
      splits = @url.query.split('&')
      splits.each do |w|
        key, value = w.split('=')
        key = key.to_sym
        params[key] = value
      end
    end
    params
  end

end

