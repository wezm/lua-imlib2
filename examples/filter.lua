-- Modified version of wallpaper.lua that allows filters to be applied

require("imlib2")
local filter_name, inpath, outpath = ...
assert(filter_name and inpath and outpath, "Usage: filter.lua [blur|sharpen|color-blur|emboss|grayscale|saturation|edge-detection] input_image output_image")

local photo = imlib2.image.load(inpath)
local filter = imlib2.filter.new()
imlib2.set_filter(filter)

-- Filters ported from:
-- http://svn.enlightenment.org/svn/e/trunk/imlib2/src/bin/imlib2_show.c
-- http://docs.gimp.org/en/plug-in-convmatrix.html gives a basic intro to
-- how the filters work
if (filter_name == "blur") then
  -- Blur filter
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
elseif (filter_name == "sharpen") then
  -- Sharpen filter
  filter:set(0, 0, 0, 5, 5, 5)
  filter:set(-1, 0, 0, -1, -1, -1)
  filter:set(0, -1, 0, -1, -1, -1)
  filter:set(1, 0, 0, -1, -1, -1)
  filter:set(0, 1, 0, -1, -1, -1)
elseif (filter_name == "color-blur") then
  -- Color blur filter
  filter:set(0, 0, 0, 3, 3, 3)
  filter:set(-1, -1, 0, 1, 0, 0)
  filter:set(1, -1, 0, 0, 1, 0)
  filter:set(0, 1, 0, 0, 0, 1)
elseif (filter_name == "emboss") then
  -- Emboss filter
  filter:set_red(-1, -1, 0, -1, -1, -1)
  filter:set_red(0, 0, 0, 1, 1, 1)
  filter:set_green(-1, -1, 0, -1, -1, -1)
  filter:set_green(0, 0, 0, 1, 1, 1)
  filter:set_blue(-1, -1, 0, -1, -1, -1)
  filter:set_blue(0, 0, 0, 1, 1, 1)

  filter:constants(0, 768, 768, 768)
  filter:divisors(0, 6, 6, 6)
elseif (filter_name == "grayscale") then
  -- Grayscale filter
  filter:set_red(0, 0, 0, 80, 1, 1)
  filter:set_green(0, 0, 0, 1, 80, 1)
  filter:set_blue(0, 0, 0, 1, 1, 80)
elseif (filter_name == "saturation") then
  -- Saturation filter
  filter:set_red(0, 0, 0, 80, -1, -1)
  filter:set_green(0, 0, 0, -1, 80, -1)
  filter:set_blue(0, 0, 0, -1, -1, 80)
elseif (filter_name == "edge") then
  -- Edge detection filter
  filter:set(-1, -1, 0, -1, -1, -1)
  filter:set(-1, 0, 0, -3, -3, -3)
  filter:set(-1, 1, 0, -1, -1, -1)
  filter:set(0, -1, 0, -3, -3, -3)
  filter:set(0, 0, 0, 16, 16, 16)
  filter:set(0, 1, 0, -3, -3, -3)
  filter:set(1, -1, 0, -1, -1, -1)
  filter:set(1, 0, 0, -3, -3, -3)
  filter:set(1, 1, 0, -1, -1, -1)
  filter:divisors(0, 3, 3, 3)
else
  -- Raise error for unknown filter
  error("'" .. filter_name .. "' is not a recognised filter")
end

photo:filter(filter)
photo:save(outpath)

