# encoding: utf-8
module Indicator
  class Spin
    attr_accessor :pre, :post, :pre_percent, :post_percent, :delay

	  def initialize opts={}
	    @frames       = opts[:frames]       || %w{ | / - \\ }
	    @delay	      = opts[:delay]        || 0.1
			@pre   	      = opts[:pre]          || ''
			@post         = opts[:post]         || ''
      @count        = opts[:count]        || nil
			@pre_percent  = opts[:pre_percent]  || ''
			@post_percent = opts[:post_percent] || ''
      init
	  end

    def init
      @current = 0
      @spin = ''
	    printf @spin
    end

	  def inc increment = 1
	    @current += increment
	  end

	  def spinning
      spin
	    sleep @delay if @delay
	  end

	  def spin
	    back
	    build
	    print @spin
	  end

    def back
      printf "\b" * @spin.length if @spin.length > 0
    end

    def clean
      return unless @spin.length > 0
      back
      printf " " * @spin.length
      back
    end

    private
    def build
      @spin = @pre
      @spin += @frames[0]
      @frames.push @frames.shift
      @spin += @pre_percent
      @spin += sprintf(" %3.2f%", @current * 100.0 / @count) if @count
      @spin += @post_percent
      @spin += @post
    end

	end
end

