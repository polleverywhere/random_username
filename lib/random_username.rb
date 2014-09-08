require "random_username/version"

module RandomUsername
  RandomUsername::Error = Class.new(StandardError)

  def self.adjective(options = {})
    get_item("adjectives", options)
  end

  def self.noun(options = {})
    get_item("nouns", options)
  end

  def self.username(options = {})
    options[:max_length] /= 2 if options[:max_length]
    adjective(options) + noun(options)
  end

  def self.get_item(filename, options = {})
    items = items_from_file(filename)
    items.select!{ |item| item.length <= options[:max_length] } if options[:max_length]
    items.sample || fail(RandomUsername::Error, "No words found")
  end

  def self.items_from_file(filename)
    filepath = File.expand_path("../random_username/#{filename}.txt", __FILE__)
    File.read(filepath).split("\n")
  end
end
