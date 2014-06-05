require 'fileutils'

plugins_folder = "#{ENV['HOME']}/Library/Application Support/Steam/userdata"
plugins = "#{plugins_folder}*"

latest_download_plugin_folder_path = Dir[plugins_folder].sort_by{ |f| File.ctime(f) }.first

match_mod_file = Dir.glob("#{latest_download_plugin_folder_path}/**/*.civ5mod").first
if match_mod_file
  FileUtils.cp(match_mod_file, "#{ENV['HOME']}/Desktop")
  `open '/Applications/StuffIt Expander.app'`
  puts "Pull the mod file in desktop to StuffIt Expander"
else
  puts "Could not find the latest mod file"
  `open #{plugins_folder}`
end

