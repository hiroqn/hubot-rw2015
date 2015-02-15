# Description:
#   You are tikuwa
#
# Commands:
#   hubot tkw <query> - Returns a image
 
{exec} = require 'child_process'
 
module.exports = (robot) ->
  
  chatLog = {}
  robot.hear /.*/, (msg) ->
    room = msg.message.room
    chatLog[room]?=[1...4]
    chatLog[room].unshift msg.message.user.id
    chatLog[room] = chatLog[room].slice 0, 4
    clr = chatLog[room]
    if clr[0] is clr[2] and clr[1] is clr[3]
      msg.send 'ちくわ大明神'
  robot.respond /tkw (.*)/i, (msg) ->
    msg.http('http://api.tiqav.com/search.json')
      .query(q: msg.match[1])
      .get() (err, res, body) ->
        images = JSON.parse(body)
        if images?.length > 0
          image  = msg.random images
        msg.send "http://tiqav.com/#{image.id}.#{image.ext}"
  robot.respond /cmd (.*)/, (msg) ->
    exec msg.match[1] || '',  (error, stdout, stderr) ->
      if stdout
        msg.send stdout
