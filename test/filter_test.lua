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

  function test_set()
    assert_error("no arguments should cause an error", function() a_filter:set() end)
    assert_error("table argument should cause an error", function() a_filter:set({}) end)
    assert_error("not enough arguments should cause an error", function() a_filter:set(1) end)
    assert_pass("right number of arguments should pass", function() a_filter:set(0, 0, 0, 5, 5, 5) end)
  end

  function test_set_alpha()
    assert_error("no arguments should cause an error", function() a_filter:set_alpha() end)
    assert_error("table argument should cause an error", function() a_filter:set_alpha({}) end)
    assert_error("not enough arguments should cause an error", function() a_filter:set_alpha(1) end)
    assert_pass("right number of arguments should pass", function() a_filter:set_alpha(0, 0, 0, 5, 5, 5) end)
  end

  function test_set_red()
    assert_error("no arguments should cause an error", function() a_filter:set_red() end)
    assert_error("table argument should cause an error", function() a_filter:set_red({}) end)
    assert_error("not enough arguments should cause an error", function() a_filter:set_red(1) end)
    assert_pass("right number of arguments should pass", function() a_filter:set_red(0, 0, 0, 5, 5, 5) end)
  end

  function test_set_green()
    assert_error("no arguments should cause an error", function() a_filter:set_green() end)
    assert_error("table argument should cause an error", function() a_filter:set_green({}) end)
    assert_error("not enough arguments should cause an error", function() a_filter:set_green(1) end)
    assert_pass("right number of arguments should pass", function() a_filter:set_green(0, 0, 0, 5, 5, 5) end)
  end

  function test_set_blue()
    assert_error("no arguments should cause an error", function() a_filter:set_blue() end)
    assert_error("table argument should cause an error", function() a_filter:set_blue({}) end)
    assert_error("not enough arguments should cause an error", function() a_filter:set_blue(1) end)
    assert_pass("right number of arguments should pass", function() a_filter:set_blue(0, 0, 0, 5, 5, 5) end)
  end

  function test_constants()
    assert_error("no arguments should cause an error", function() a_filter:constants() end)
    assert_error("table argument should cause an error", function() a_filter:constants({}) end)
    assert_error("not enough arguments should cause an error", function() a_filter:constants(1) end)
    assert_pass("right number of arguments should pass", function() a_filter:constants(0, 768, 768, 768) end)
  end

  function test_divisors()
    assert_error("no arguments should cause an error", function() a_filter:divisors() end)
    assert_error("table argument should cause an error", function() a_filter:divisors({}) end)
    assert_error("not enough arguments should cause an error", function() a_filter:divisors(1) end)
    assert_pass("right number of arguments should pass", function() a_filter:divisors(0, 6, 6, 6) end)
  end
end

