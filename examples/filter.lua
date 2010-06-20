-- Modified version of wallpaper.lua that allows filters to be applied

require("imlib2")
local path = ...
assert(path, "Usage: filter.lua /path/to/image/to/filter")

local photo = imlib2.image.load(path)

-- Blur filter
filter = imlib2.filter.new()
filter:set(0, 0, 0, 8, 8, 8)
filter:set(-1, 0, 0, 4, 4, 4)
filter:set(0, -1, 0, 4, 4, 4)
filter:set(1, 0, 0, 4, 4, 4)
filter:set(0, 1, 0, 4, 4, 4)
filter:set(-2, 0, 0, 1, 1, 1)
filter:set(0, -2, 0, 1, 1, 1)
filter:set(2, 0, 0, 1, 1, 1)
filter:set(0, 2, 0, 1, 1, 1)
filter:set(-1, -1, 0, 1, 1, 1)
filter:set(-1, 1, 0, 1, 1, 1)
filter:set(1, -1, 0, 1, 1, 1)
filter:set(1, 1, 0, 1, 1, 1)
photo:filter(filter)
photo:save("blur.jpg")

-- Grayscale filter
filter = imlib2.filter.new()
filter:set_red(0, 0, 0, 80, 1, 1);
filter:set_green(0, 0, 0, 1, 80, 1);
filter:set_blue(0, 0, 0, 1, 1, 80);
photo:filter(filter)
photo:save("grayscale.jpg")

-- Saturation filter
filter = imlib2.filter.new()
filter:set_red(0, 0, 0, 80, -1, -1);
filter:set_green(0, 0, 0, -1, 80, -1);
filter:set_blue(0, 0, 0, -1, -1, 80);
photo:filter(filter)
photo:save("saturation.jpg")

-- Emboss filter
filter = imlib2.filter.new()
filter:set_red(-1, -1, 0, -1, -1, -1);
filter:set_red(0, 0, 0, 1, 1, 1);
filter:set_green(-1, -1, 0, -1, -1, -1);
filter:set_green(0, 0, 0, 1, 1, 1);
filter:set_blue(-1, -1, 0, -1, -1, -1);
filter:set_blue(0, 0, 0, 1, 1, 1);

filter:constants(0, 768, 768, 768);
filter:divisors(0, 6, 6, 6);
photo:filter(filter)
photo:save("emboss.jpg")

