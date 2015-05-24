require 'rubygems'
require 'rmagick'

module Prizm
  class Extractor
    def initialize(img_location)
      @image = Magick::ImageList.new(img_location)
    end

    def get_colors(nc=6, remove_bg=true)
        image = remove_bg ? remove_bg(nc) : reduce_size(100, 100)
        q = image.quantize(nc)
        colors = q.color_histogram.sort {|a, b| b[1] <=> a[1]}.map { |color, count| color }
    end

    def to_hex(pixel)
      pixel.to_color(Magick::AllCompliance, false, 8)
    end

    private

    def reduce_size(width, height)
      @image.change_geometry!("#{width}x#{height}") { |cols, rows, img| img.resize!(cols, rows) }
    end

    def remove_bg(nc, fuzz=20)
      image = reduce_size(100, 100)
      image = image.border(1, 1, image.pixel_color(0,0))
      image = image.quantize(nc+4)
      image.fuzz = "#{fuzz}%"
      a = image.color_floodfill(0, 0, image.pixel_color(0,0))
      a = a.matte_floodfill(0,0)
    end
  end
end