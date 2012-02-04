require File.expand_path('../indicator/spin', __FILE__)

module Indicator
  class << self

    def spinner

    end

    def spin opts={}, &blk
      spinner   = opts[:spinner] || CharTree::Spin.new
      noclean     = opts[:noclean] || false
      ondemand	= opts[:ondemand] || false

      if ondemand
        yield spinner
      else
        t = Thread.new { yield }

        while t.alive?
          spinner.spinning
        end

        t.join
      end

      spinner.clean unless noclean
    end

  end
end
