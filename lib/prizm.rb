require 'rubygems'
require 'RMagick'

module Prizm
  class Extractor
    def get_colors(img_location, nc=6, remove_bg=true)
      begin
        image = remove_bg ? remove_bg(img_location, nc) : reduce_size(Magick::ImageList.new(img_location), 100, 100)
        q = image.quantize(nc)
        colors = q.color_histogram.sort {|a, b| b[1] <=> a[1]}.map { |color, count| color }
      rescue Magick::ImageMagickError => e
        puts e.message
        puts e.backtrace
        nil
      end
    end
    
    def to_hex(pixel)
      pixel.to_color(Magick::AllCompliance, false, 8)
    end
    
    def reduce_size(image, width, height)
      image.change_geometry!("#{width}x#{height}") { |cols, rows, img| img.resize!(cols, rows) }
    end
    
    def remove_bg(img_location, nc, fuzz=20)
      image = reduce_size Magick::ImageList.new(img_location), 100, 100
      image = image.border(1, 1, image.pixel_color(0,0))
      image = image.quantize(nc+4)
      image.fuzz = "#{fuzz}%"
      a = image.color_floodfill(0, 0, image.pixel_color(0,0))
      a = a.matte_floodfill(0,0)
      a
    end
  end
end