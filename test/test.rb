require "#{File.dirname(__FILE__)}/../lib/prizm"
require 'test/unit'

class TestExtractor < Test::Unit::TestCase
  def test_functional
    colors = Prizm::Extractor.get_colors("#{File.dirname(__FILE__)}/rainbow.jpg", 6)
    assert_equal(6, colors.size)
  end
  
  def test_to_hex
    colors = Prizm::Extractor.get_colors("#{File.dirname(__FILE__)}/rainbow.jpg", 6)
    assert_equal('#322D31', Prizm::Extractor.to_hex(colors[0]))
  end
  
  def test_error
    c = Prizm::Extractor.get_colors("blahblah.jpg")
    assert_equal(nil, c)
  end
end