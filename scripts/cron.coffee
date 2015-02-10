cron = require('cron').CronJob

module.exports = (robot) ->

  new cron '0 0 23 10-22 2 1-5', () =>

    robot.send {room: "#random"}, "チーム会やった？"
  , null, true, "Asia/Tokyo"