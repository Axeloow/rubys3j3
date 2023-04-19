#Pré-requis de fonctionnement du programme
require 'http'
require 'json'
require 'dotenv'
Dotenv.load

#Création de la clé API
api_key = ENV["OPENAI_API_KEY"]
url = "https://api.openai.com/v1/engines/text-babbage-001/completions"

#Demande d'autorisation d'utilisation envers OpenAI
headers = {
  "Content-Type" => "application/json",
  "Authorization" => "Bearer #{api_key}"
}

#Envoi des informations vers OpenAI
data = {
  "prompt" => "J'aimerais cuisiner quelque chose. Propose-moi une recette avec 3 ingrédients, et les étapes vers la création d'un plat",
  "max_tokens" => 200,
  "temperature" => 0.5
}

#Envoi des informations, et réception de la réponse avant de sélectionner le texte rendu
response = HTTP.post(url, headers: headers, body: data.to_json)
response_body = JSON.parse(response.body.to_s)
response_string = response_body['choices'][0]['text'].strip

#Envoi de l'information vers le terminal
puts "Voici une recette à essayer:"
puts response_string