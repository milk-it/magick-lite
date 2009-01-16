require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test Magick Lite'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the sitemaper plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'MagickLite'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

desc "generate FFI structs"
task :ffi_generate do
  require 'ffi'
  require 'ffi/tools/generator'
  require 'ffi/tools/struct_generator'

  ffi_files = Dir.glob('lib/magick_lite/*.ffi')
  ffi_options = {'-I' => '/usr/local/libMagick.so'}
  ffi_files.each do |ffi_file|
    ffi_file = File.join(File.dirname(__FILE__), ffi_file)
    ruby_file = ffi_file.gsub(/\.ffi$/,'')
    print "Generating: #{File.basename(ffi_file)} => #{File.basename(ruby_file)}\t\t"
    if uptodate?(ruby_file, ffi_file)
      puts "UP TO DATE"
    else
      FFI::Generator.new ffi_file, ruby_file, ffi_options
      puts "DONE"
    end
  end
end
