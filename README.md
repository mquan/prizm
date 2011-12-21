#Quick start

require 'prizm'

Prizm::Extractor.get_colors("http://farm3.staticflickr.com/2334/2400630645_eb571311fe.jpg", 6)

>> [red=41615, green=55152, blue=58322, opacity=0, red=15320, green=16044, blue=17951, opacity=0, red=28948, green=40598, blue=45837, opacity=0, red=4983, green=5000, blue=11808, opacity=0, red=37953, green=47863, blue=50956, opacity=0, red=34056, green=36538, blue=21226, opacity=0] 