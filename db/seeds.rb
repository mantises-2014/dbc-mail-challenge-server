puts "loading dictionary.."
MobyDicktionary = MarkyMarkov::Dictionary.new("moby_dicktionary")
# moby_dicktionary.parse_file(File.join(File.dirname(__FILE__), "..", "fixtures", "mobydick.txt"))

100.times do
  Message.create!(
    from: "#{MobyDicktionary.generate_2_words.gsub(/\W/, "").downcase}@ahab.com",
    subject: MobyDicktionary.generate_5_words,
    body: MobyDicktionary.generate_5_sentences
  )
end

EmailAddress.create!(name: "Bob", email_address: "bob@example.com")
ApiToken.create!(team_name: "bobomanders")
