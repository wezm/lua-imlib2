require("lunit")

local imlib2 = require "imlib2"

module("a newly created filter", lunit.testcase)
do
  function setup()
    a_filter = imlib2.filter.new()
  end

  function test__tostring()
    assert_string(a_filter:__tostring())
  end
end

