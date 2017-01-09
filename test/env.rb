require 'dotenv'
Dotenv.load

$production = ENV['production'] == 'true'
$app_key = ENV['appKey']
$app_secret = ENV['appSecret']
$server = ENV['server']
$username = ENV['username']
$extension = ENV['extension']
$password = ENV['password']
$receiver = ENV['receiver']
