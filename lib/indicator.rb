require File.expand_path('../indicator/spin', __FILE__)

module Indicator
  class << self

    def spinner

    end

    def spin spin = CharTree::Spin.new, opts={}, &blk
      ondemand	= opts[:ondemand] || false
      noclear   = opts[:noclear] || false

      if ondemand

      else
        t = Thread.new { yield }

        while t.alive?
          spin.spinning
        end

        t.join
      end
    end

  end
end
