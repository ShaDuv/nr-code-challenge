require_relative "solution"
require "test/unit"
 
class TestSolution < Test::Unit::TestCase
 
  def test_clean_text
    assert_equal(["the", "project", "gutenberg"], clean_text("The Project Gutenberg"))
  end

  def test_clean_text_garbage
    assert_equal(["a"], clean_text("!@#%^$*#(A?."))
  end
 
  def test_group
    assert_equal({
        "little try see" => 1,
        "try see win" => 1,
        "see win win" => 1,
        "win win win" => 1
        }, group(["little", "try", "see", "win", "win", "win"]))
  end

  def test_top_values
    assert_equal([
        "10 - try see win",
        "5 - win win win",
        "4 - little try see", 
        "2 - see win win"], 
        top_values({
        "little try see" => 4,
        "try see win" => 10,
        "see win win" => 2,
        "win win win" => 5
        }))
  end


end