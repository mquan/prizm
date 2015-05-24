require "#{File.dirname(__FILE__)}/../lib/prizm"
require 'test/unit'

class TestExtractor < Test::Unit::TestCase
  def test_functional
    colors = Prizm::Extractor.new("#{File.dirname(__FILE__)}/rainbow.jpg").get_colors(6, false)
    assert_equal(6, colors.size)
  end

  def test_to_hex
    extr = Prizm::Extractor.new("#{File.dirname(__FILE__)}/rainbow.jpg")
    colors = extr.get_colors(6, false)
    assert_equal('#322D31', extr.to_hex(colors[0]))
  end

  def test_error
    assert_raise(Magick::ImageMagickError) { Prizm::Extractor.new("blahblah.jpg").get_colors }
  end
end
