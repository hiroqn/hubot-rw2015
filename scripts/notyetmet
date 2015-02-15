module.exports = (robot) ->
  prevMessage = {}
  robot.hear /(.*)/, (msg) ->
    room = msg.message.room
    prev = prevMessage[room]
    prevMessage[room] = msg.match[1]
    if msg.match[1] is 'まだ'
      return msg.send 'ここにない'
    if prev is 'まだ' and msg.match[1] is '出会い'
      msg.send ':recruit:'
      
