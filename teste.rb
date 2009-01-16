require 'rubygems'
require 'lib/magick_lite'

include MagickLite

puts Bridge.version

image = Image.from_blob(File.read('dsc07524.jpg'))

puts image.width.to_s
puts image.height.to_s
