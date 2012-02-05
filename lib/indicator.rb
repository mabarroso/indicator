# encoding: utf-8
require File.expand_path('../indicator/spin', __FILE__)

module Indicator
  class << self

    def set name = :bar
      case name
      when :bar
        %w{ | / - \\ }
      when :x
        %w{ + X }
      when :<
        %w{ | < }
      when :>
        %w{ | > }
      when :V
        %w{ V > ^ }
      when :dots
        %w{ : . }
      when :bars
        %w{ - = }
      when :p
        %w{ p b d q }
      when :bqpd
        %w{ bq pd }
      when :-
        %w{ - ~ }
      else
        %w{ | / - \\ }
      end
    end

    def spinner opts={}
      opts[:frames] = set opts[:set] unless opts[:frames]
      Indicator::Spin.new opts
    end

    def spin opts={}, &blk
      spinner   = opts[:spinner] || self.spinner(opts)
      noclean   = opts[:noclean] || false
      ondemand	= opts[:ondemand] || false

      if ondemand
        yield spinner
      else
        t = Thread.new { yield spinner }

        while t.alive?
          spinner.spinning
        end

        t.join
      end

      spinner.clean unless noclean
    end

  end
end
