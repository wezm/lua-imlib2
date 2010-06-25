require("lunit")

local imlib2 = require "imlib2"

module("a newly created image", lunit.testcase)
do
  function setup()
    a_image = imlib2.image.new(64, 64)
  end

  function test__tostring()
    assert_string(a_image:__tostring())
  end

  function test_set_quality()
    assert_error("no arguments should cause an error", function() a_image:set_quality() end)
    assert_error("table argument should cause an error", function() a_image:set_quality({}) end)
    assert_error("negative quality should cause an error", function() a_image:set_quality(-1) end)
    assert_error("quality greater than 100 should cause an error", function() a_image:set_quality(101) end)
    assert_pass("quality of 0 should pass", function() a_image:set_quality(0) end)
    assert_pass("quality of 50 should pass", function() a_image:set_quality(50) end)
    assert_pass("quality of 100 should pass", function() a_image:set_quality(100) end)
  end

  function test_set_get_alpha_true()
    a_image:set_has_alpha(true)
    assert_true(a_image:has_alpha(), "should have alpha channel")
  end

  function test_set_get_alpha_false()
    a_image:set_has_alpha(false)
    assert_false(a_image:has_alpha(), "should not have alpha channel")
  end
end

