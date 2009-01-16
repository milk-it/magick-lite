$:.unshift(File.dirname(__FILE__))
require 'rubygems'
gem 'ffi', '>= 0.2.0'
require 'ffi'
require 'magick_lite/bridge'
require 'magick_lite/image'
require 'magick_lite/image_info'
require 'magick_lite/exception_info'

module MagickLite
  MAJOR, MINOR, TINY = 0, 1, 0

  # MagickSignature = 0xabacadabUL

  # Get the running version of MagickLite
  def self.version
    [MAJOR, MINOR, TINY].join('.')
  end
end
