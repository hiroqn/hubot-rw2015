module.exports = (robot) ->
  robot.hear /ぞい/i, (msg) ->
    msg.send "ぞい"

  robot.hear /ダレカタスケテー/i, (msg) ->
    msg.send "チョットマッテテー"

  robot.adapter.on 'connected', () ->
    robot.send room: 'hubot-dev', "ちょっと再起動してたわ。またスクリプト読み込んでな"
