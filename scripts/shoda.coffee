module.exports = (robot) ->
  robot.hear /庄田(.*)/, (msg) ->
    msg.send "さんをつけろよデコ助野郎" unless msg.match[1].match /^(さん|様)/

  robot.respond /photo(?: bomb (\d+))?/, (msg) ->
    count = parseInt(msg.match[1], 10) || 1
    for i in [1..count]
      index = Math.ceil(Math.random() * 13)
      msg.send "https://dl.dropboxusercontent.com/u/11497352/shoda/#{index}.jpg"


  reset_timer = null
  robot.hear /(shoda|庄田)/, (msg) ->
    count = robot.brain.get('shoda_count') || 0
    if count >= 9
      msg.send 'お前ら俺で遊びすぎやろ！！'
      robot.brain.set('shoda_count', 0)
      clearTimeout(reset_timer)
    else
      robot.brain.set('shoda_count', count + 1)
      clearTimeout(reset_timer)
    reset_timer = setTimeout ->
      robot.brain.set('shoda_count', 0)
    , 60000
