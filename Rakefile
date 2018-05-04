require "bundler/gem_tasks"

source_dir = "shards-ui-src" 

namespace :javascripts do

  desc "Cleaning javascripts directory"
  task :clean do
   rm_rf "assets/javascripts/shards"
  end
  
  desc "Copy #{source_dir}/assets/js/src"
  task :copy do
    src_dir = "#{source_dir}/dist/js/."
    #tgt_dir = "assets/javascripts/shards/"
    #mkdir_p tgt_dir
    #cp_r src_dir, tgt_dir
    cp "#{src_dir}/shards.js", "assets/javascripts/shards.js"
    cp "#{src_dir}/shards.min.js", "assets/javascripts/shards.min.js"
    
    #src_dir = "#{source_dir}/js/dist/third-party/."
    #tgt_dir = "assets/javascripts/shards/addons"
    #mkdir_p tgt_dir
    #cp_r src_dir, tgt_dir
  end

  desc "Remove map"
  task :tidy do
    Dir.glob('assets/javascripts/**/*.js').each do |tgt_file|
      content = File.read(tgt_file)
      removed_map_content = content.sub(%r{^//# sourceMappingURL=.*\n?\z}, '')
      File.open(tgt_file, "w") { |f| f.puts removed_map_content}
    end
  end

  desc "Setup javascript assets"
  task setup: [:clean, :copy, :tidy]
end

namespace :stylesheets do
  desc "Cleaning stylesheets directory"
  task :clean do
   rm_rf "assets/stylesheets/shards"
  end

  desc "Copy #{source_dir}/src/scss/"
  task :copy do
    src_dir = "#{source_dir}/src/scss/."
    tgt_dir = "assets/stylesheets/shards/"
    mkdir_p tgt_dir
    cp_r src_dir, tgt_dir
  end
 
  desc "Fix font url in stylesheets"
  task :fix_urls do
    Dir.glob('assets/stylesheet/**/*.scss').each do |tgt_file|
      content = File.read(tgt_file)
      fixed_content = content.gsub(/url\(\"\.\.\/Roboto\/([A-Za-z_]*.woff2)\"\)/, 'font-url("\1")')
      File.open(tgt_file, "w") { |f| f.puts fixed_content}
    end
  end

  desc "Setup stylesheet assets"
  task setup: [:clean, :copy, :fix_urls]
end

desc "Remove minified file .min"
task :cleanup do
  Dir.glob('assets/**/*.min.*').each do |file|
    rm file
  end
end

desc "Setup or update assets files"
task setup: ["javascripts:setup", "stylesheets:setup"]