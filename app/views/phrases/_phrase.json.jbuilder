json.phrase do
  json.id @phrase.id
  json.text @phrase.text
end

json.available do
  json.count @available
end
