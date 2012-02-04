# encoding: utf-8
module CharTree
  class Spin
    attr_accessor :pre, :post, :delay

	  def initialize opts={}
	    @frames = opts[:frames] || %w{ | / - \\ }
	    @delay	= opts[:delay]  || 0.1
			@pre   	= opts[:pre]    || ''
			@post   = opts[:post]   || ''
      @count  = opts[:count]  || nil
      init
	  end

    def init
      @current = 0
      @spin = false
    end

	  def inc
	    @current += 1
	  end

	  def spinning
	    build
	    printf @spin
	    sleep @delay if @delay
	    clear
	  end

    def clear
      printf "\b" * @spin.length
    end

    private
    def build
      @spin = @pre
      @spin += @frames[0]
      @frames.push @frames.shift
      @spin += sprintf(" %3.2f%%", @count * 100.0 / @current) if @count
      @spin += @post
    end

	end
end

