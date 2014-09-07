require 'fileutils'
require 'ruby-debug'
require 'pathname'
require 'shellwords'

begin
  default_mod_path = ENV['MOD_PATH'] || "#{ENV['HOME']}/Documents/Aspyr/Sid Meier's Civilization 5/MODS/"
  plugins_folder = "#{ENV['HOME']}/Library/Application Support/Steam/userdata"
  plugins = "#{plugins_folder}/*"

  latest_download_plugin_folder_path = Dir[plugins].sort_by{ |f| File.ctime(f) }.first
  last_download_plugin_folder_path = Dir["#{ latest_download_plugin_folder_path }/ugc/referenced/*"].sort_by{ |f| File.ctime(f) }.last

  match_mod_file = if $*.any?{|input| input =~ /file/}
    query_file = $*.any?{|input| input =~ /file/} ? $*.find{|input| input =~ /file=(.*)/}.gsub('file=', '') : ''
    Dir.glob("#{latest_download_plugin_folder_path}/**/*#{query_file}*.civ5mod").first
  else
    Dir.glob("#{last_download_plugin_folder_path}/**/*#{query_file}*.civ5mod").first
  end

  if match_mod_file
    FileUtils.cp(match_mod_file, "#{ENV['HOME']}/Desktop")
    # http://unarchiver.c3.cx/commandline
    unarchive_command = `which unar`

    puts "extract mod #{Pathname.new(match_mod_file).basename.to_s} to #{default_mod_path}"
    `#{unarchive_command.strip} -f #{Shellwords.escape(match_mod_file.strip)} -o #{Shellwords.escape(default_mod_path.strip)}`
    `open #{Shellwords.escape(default_mod_path)}`
  else
    puts "Could not find the latest mod file"
    `open '#{plugins_folder}'`
  end

rescue
  exit
end
