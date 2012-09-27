#!/usr/bin/env ruby

class Console

  @@debug_mode = false
  def initialize debug
    @@debug_mode = debug
  end

  def toInfoConsole str
    if @@debug_mode == true
      puts "[ INFO ] : " + str
    else
      puts "[ INFO ] : " + str
    end
  end

  def toErrorConsole str
    if @@debug_mode == true
      puts "[ ERROR ] : " + str
    else
      nil
    end
  end

  def toFatalConsole str
    if @@debug_mode == true
      puts "[ FATAL ] : " + str
    else
      nil
    end
  end

  def toWarnConsole str
    if @@debug_mode == true
      puts "[ WARN ] : " + str
    else
      puts "[ WARN ] : " + str
    end
  end

end