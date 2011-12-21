require 'rubygems'
require 'RMagick'

module Prizm
  class Extractor
    def self.get_colors(img_location, nc=1)
      begin
        image = Magick::ImageList.new(img_location)
        image.change_geometry!('100x100') { |cols, rows, img| img.resize!(cols, rows) }
        q = image.quantize(nc)
        colors = q.color_histogram.sort {|a, b| b[1] <=> a[1]}.map { |color, count| color }
      rescue Magick::ImageMagickError
        puts "Error loading image: Please specify a valid image location"
      end
    end
    
    def self.to_hex(pixel)
      pixel.to_color(Magick::AllCompliance, false, 8)
    end
  end
end
