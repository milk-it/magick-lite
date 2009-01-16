require 'rubygems'
require '../lib/magick_lite'

include MagickLite

puts Bridge.version

image = Image.from_blob(File.read('dsc07524.jpg'))
#image = Image.from_file('dsc07524.jpg')

puts image.width.to_s
puts image.height.to_s

thumb = image.resize(image.width / 2, image.height / 2)

puts thumb.width.to_s
puts thumb.height.to_s

thumb.write('thumb.jpg')
