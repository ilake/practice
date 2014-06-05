require 'fileutils'
require 'ruby-debug'

begin
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
    `open '/Applications/StuffIt Expander.app'`
    puts "Pull the mod file in desktop to StuffIt Expander"
    `open '#{plugins_folder}'` if $*.include?('open')
  else
    puts "Could not find the latest mod file"
    `open '#{plugins_folder}'`
  end

rescue
  exit
end
