#!/usr/bin/env ruby

#TODO: argument parser

require 'knob-admin/general'
require 'knob-admin/console'

module KnobAdmin
  def self.main args
    begin
    if args != []
      if args.index "-add" != nil
        if args.index "-pass" != nil then
          if args.index "-v" != nil
            uname = args[(args.index "-add")+1]
            passw = args[(args.index "-pass")+1]
            KnobAdminCore.useradd true, uname, passw
          else
            uname = args[(args.index "-add")+1]
            passw = args[(args.index "-pass")+1]
            KnobAdminCore.useradd false, uname, passw
          end
        else
          @console.toInfoConsole "Password for #{args[(args.index "-add")+1]} must be supplied after argument -pass"
        end
      else if args.index "-rem" != nil
        if args.index "-v" != nil
          uname = args[(args.index "-rem")+1]
          if args.include? "-h" then
            KnobAdminCore.userdel true, uname, true
          else 
            KnobAdminCore.userdel true, uname, false
          end
        else
          uname = args[(args.index "-rem")+1]
          if args.include? "-h" then
            KnobAdminCore.userdel false, uname, true
          else
            KnobAdminCore.userdel false, uname, false
          end
        end
      else if args.include? "monit"
        if args.include? "-v"
          #TODO: Grep process for already running if and warn if want to run multi do multi run with -m
          KnobAdminCore.monit true
        else
          KnobAdminCore.monit false
        end
      else if true
      end
    else
      help
    end
    rescue Exception => ex
      @console.toFata
      #TODO: fatal console değiştir.
  end
  
  def self.help
    puts "Help comin"
  end
end