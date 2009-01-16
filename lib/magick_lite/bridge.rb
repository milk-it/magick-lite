module MagickLite
  module Bridge
    extend FFI::Library

    begin
      if RUBY_PLATFORM =~ /darwin/
        ffi_lib 'MagickCore'
      elsif RUBY_PLATFORM =~ /linux/
        ffi_lib 'Magick'
      end
    rescue
      raise 'Could not find libMagick or libMagickCore, exiting.'
    end

    [
      [:GetMagickVersion, [:pointer], :string],
      [:GetImageAttribute, [:pointer, :string], :string],
      [:CloneImageInfo, [:pointer], :pointer],
      [:AcquireExceptionInfo, [], :pointer],
      # [:AcquireImage, [:pointer], :pointer],
      [:AcquireImageInfo, [], :pointer],

      [:ResizeImage, [:pointer, :long, :long, :int, :double, :pointer], :pointer],

      [:BlobToImage, [:pointer, :pointer, :int, :pointer], :pointer],
      [:ImageToFile, [:pointer, :string, :pointer], :int],
      [:FileToImage, [:pointer, :string], :int],
      # [:WriteImage, [:pointer, :string], :int],

      [:DestroyExceptionInfo, [:pointer], :pointer],
      [:DestroyImageInfo, [:pointer], :pointer],
      [:DestroyImage, [:pointer], :pointer]
    ].each do |func|
      attach_function(*func)
    end

    def self.version
      GetMagickVersion(nil)
    end
  end
end
