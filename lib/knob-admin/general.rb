#!/usr/bin/env ruby

require 'rubygems'

require 'libcfruby/cfrubyscript'

#Local imports
require 'knob-admin/console'

module KnobAdminCore
  
  ## Get system name
  def systemname
    return $os.name.chomp
  end
  
  def self.getUserLoad user
    #Linux type
    load = `top -b -n 1 -u #{user} | awk 'NR>7 { load += $9; } END { print load; }'`.chomp
    if 40.0 < Double(load)
      warn = "[ WARN ] : Your cpu load is #{Double(load)} please prevent your memory leak."
      puts warn
    end
  end
  
  def self.useradd debug_mode, username, passwd
    @console = Console.new(debug_mode)
    begin
      $user.adduser(username, passwd)
      @console.toInfoConsole "User #{username} added."
    rescue Exception => ex
      @console.toErrorConsole ex.message
    end
  end
  
  def self.userdel debug_mode, username, delete_home
    @console = Console.new(debug_mode)
    begin
      $user.deleteuser(username ,delete_home)
      if delete_home == true
        @console.toInfoConsole "User #{username}'s account and homedir deleted."
      else
        @console.toInfoConsole "User #{username}'s account deleted."
      end
    rescue Exception => ex
      @console.toErrorConsole ex.message
    end
  end
  
end