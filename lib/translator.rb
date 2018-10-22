# require modules here
require "pry"
require "yaml"

def load_library(file)
  # code goes here
  emotes = YAML.load_file(file)
  emote_hash = {
    'get_meaning' => {},
    'get_emoticon' => {}
  }
  
  emotes.each do |meaning, emoticons|
    emote_hash['get_meaning'][emoticons[1]] = meaning
    emote_hash['get_emoticon'][emoticons[0]] = emoticons[1]
  end 
  
  emote_hash
end

def get_japanese_emoticon(file, emoticon)
  # code goes here
  emote_hash = load_library(file)
  message = ""
  
  emote_hash['get_emoticon'].each do |english, japenese|
    if english == emoticon
      message = japenese
    end 
  end 
  
  if message == ""
    message = "Sorry, that emoticon was not found"
  end
    
  message
end

def get_english_meaning(file, emoticon)
  # code goes here
  emote_hash = load_library(file)
  message = ""
  
  emote_hash['get_meaning'].each do |japenese_emote, meaning|
    if japenese_emote == emoticon
      message = meaning
    end 
  end 
  
  if message == ""
    message = "Sorry, that emoticon was not found"
  end
    
  message
end