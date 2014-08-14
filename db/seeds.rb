puts "loading dictionary.."
MobyDicktionary = MarkyMarkov::Dictionary.new("moby_dicktionary")
# moby_dicktionary.parse_file(File.join(File.dirname(__FILE__), "..", "fixtures", "mobydick.txt"))

1000.times do
  Message.create!(
    from: "#{MobyDicktionary.generate_2_words.gsub(/\W/, "").downcase}@ahab.com",
    subject: MobyDicktionary.generate_5_words,
    body: MobyDicktionary.generate_5_sentences
  )
end
