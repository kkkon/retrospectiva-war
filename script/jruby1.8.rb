#!/usr/bin/env ruby

jruby_openssl_re = /"jruby-openssl"/

File::open("Gemfile","r") { |gin|
  File::open("Gemfile.patch","w") { |gout|
    gin.each {|line|
      ##gem "jruby-openssl"
      if jruby_openssl_re =~ line
        line = "  gem \"jruby-openssl\", \"0.7\""
      end

      gout.puts line
    }
  }
}

require 'fileutils'
FileUtils.mv 'Gemfile.patch', 'Gemfile'
