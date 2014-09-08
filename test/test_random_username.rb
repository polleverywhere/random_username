require "minitest/autorun"
require "random_username"

class TestRandomUsername < Minitest::Test
  def test_adjective
    refute_empty RandomUsername.adjective
  end

  def test_adjective_max_length
    adjective = RandomUsername.adjective(:max_length => 4)
    assert adjective.length <= 4
  end

  def test_adjective_invalid_max_length
    assert_nil RandomUsername.adjective(:max_length => 1)
  end

  def test_noun
    refute_empty RandomUsername.noun
  end

  def test_noun_max_length
    noun = RandomUsername.noun(:max_length => 4)
    assert noun.length <= 4
  end

  def test_noun_invalid_max_length
    assert_nil RandomUsername.noun(:max_length => 1)
  end
end
