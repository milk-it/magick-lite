$:.unshift(File.dirname(__FILE__))
require 'ffi'
require 'magick_lite/bridge'
require 'magick_lite/image'
require 'magick_lite/image_info'
require 'magick_lite/exception_info'

module MagickLite
  MAJOR, MINOR, TINY = 0, 1, 0

  # Get the running version of MagickLite
  def version
    [MAJOR, MINOR, TINY].join('.')
  end
end
