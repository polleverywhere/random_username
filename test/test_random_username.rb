require "minitest/autorun"
require "random_username"

class TestRandomUsername < Minitest::Test
  def all_adjectives
    @all_adjectives ||= RandomUsername.items_from_file("adjectives")
  end

  def all_nouns
    @all_nouns ||= RandomUsername.items_from_file("nouns")
  end

  def test_adjective
    adjective = RandomUsername.adjective
    refute_empty adjective
    assert_includes all_adjectives, adjective
  end

  def test_adjective_max_length
    adjective = RandomUsername.adjective(:max_length => 4)
    assert adjective.length <= 4
  end

  def test_adjective_invalid_max_length
    assert_raises RandomUsername::Error do
      RandomUsername.adjective(:max_length => 1)
    end
  end

  def test_noun
    noun = RandomUsername.noun
    refute_empty noun
    assert_includes all_nouns, noun
  end

  def test_noun_max_length
    noun = RandomUsername.noun(:max_length => 4)
    assert noun.length <= 4
  end

  def test_noun_invalid_max_length
    assert_raises RandomUsername::Error do
      RandomUsername.noun(:max_length => 1)
    end
  end

  def test_username
    username = RandomUsername.username
    refute_empty username
    anchor = (2..username.length).detect do |i|
      all_adjectives.include?(username[0..i])
    end
    assert_includes all_adjectives, username[0..anchor]
    assert_includes all_nouns, username[anchor+1..-1]
  end

  def test_username_max_length
    username = RandomUsername.username(:max_length => 10)
    assert username.length <= 10
  end

  def test_username_invalid_max_length
    assert_raises RandomUsername::Error do
      RandomUsername.username(:max_length => 2)
    end
  end
end
