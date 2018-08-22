require "yaml"

def load_library(path)
  emoticon = YAML.load_file(path)
  translate = {"get_meaning" => {}, "get_emoticon" => {}}

  emoticon.each do |key, value|
  	# asian face => meaning
  	translate["get_meaning"][value[1]] = key
  	# english face => asian face
  	translate["get_emoticon"][value[0]] = value[1]
  end
  return translate
end

def get_japanese_emoticon(path, emoticon)
  dictionary = load_library(path)
  face = dictionary["get_emoticon"][emoticon]
  if face == nil
  	return "Sorry, that emoticon was not found"
  end
  return face
end

def get_english_meaning(path, emoticon)
  dictionary = load_library(path)
  face = dictionary["get_meaning"][emoticon]
  if face == nil
  	return "Sorry, that emoticon was not found"
  end
  return face
end