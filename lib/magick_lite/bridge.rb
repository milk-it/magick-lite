module MagickLite
  module Bridge
    extend FFI::Library
    
    LIBNAME = 'libMagick.so'

    ['/usr/lib/', '/usr/local/lib'].find do |path|
      path = "#{path}/#{LIBNAME}"
      if File.exists?(path)
        ffi_lib path
      else
        false
      end
    end

    attach_function :GetMagickVersion, [:pointer], :string
    attach_function :GetImageAttribute, [:pointer, :string], :string
    attach_function :BlobToImage, [:pointer, :pointer, :int, :pointer], :pointer
    attach_function :CloneImageInfo, [:pointer], :pointer
    attach_function :AcquireExceptionInfo, [], :pointer
    attach_function :ResizeImage, [:pointer, :long, :long, :pointer, :double, :pointer], :pointer

    def self.version
      GetMagickVersion(nil)
    end
  end
end
