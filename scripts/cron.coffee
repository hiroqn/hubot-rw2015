cron = require('cron').CronJob

module.exports = (robot) ->
  new cron '0 45 16 10 2 1-5', () =>
    robot.send {room: "#random"}, "そろそろ完成？"
  , null, true, "Asia/Tokyo"