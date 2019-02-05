require 'rake'
require 'fileutils'
include FileUtils

$home = ENV['HOME']
raise "#{$home} is not a directory" if not File.directory? $home

task :default => :install_all

desc "Copy dotfiles into home directory w/correct permissions."
task :install_all do
	puts "Installing dotfiles into #{$home} ..."
    files = %w{
        Xresources
        bash_login
        conkyrc
        gemrc
        xinitrc
        xerverrc
        xsession
        pandoc
        fonts
    }
    files.each { |f| install f }
end

def install(filename)
    if File.directory?(filename)
        dest_filename = dest(filename)
        mkdir_p dest_filename, :verbose => false
        chmod 0755, dest_filename, :verbose => false
        Dir[File.join(filename, '*')].each {|f| install f }
    else
        dest_filename = dest(filename)
        puts "Copying #{filename} to #{dest_filename} ..."
        if File.exists? dest_filename and not File.writable? dest_filename
            perms = File.lstat(dest_filename).mode | 0200
            chmod perms, dest_filename, :verbose => false
        end
        cp filename, dest_filename, :verbose => false
        chmod 0444, dest_filename, :verbose => false
    end
end

def dest(filename)
    File.join($home, '.' + filename)
end
