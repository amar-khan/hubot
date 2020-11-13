# Description
#   Checks the free disk space on each server in the server group specified
#
# Author:
#  Amar Khan <amarkotasky@gmail.com>

child_process = require 'child_process'
async = require 'async'


module.exports = (robot) ->
  robot.respond /check disk space/i, (msg) ->
    msg.reply "Please Wait getting disk status for *localhost*"
    send_msg = (msgText) -> msg.send msgText
    robot.emit "check:disk:space", send_msg
    console.log 'akbot check disk space dev'

  robot.on 'check:disk:space',(send_msg) ->
    async.series(
      [
        (callback) ->
          check_disk_space(callback)
      ], (err,check_results) ->
        if err
          send_msg "```#{err}```"
        else
          message = ("#{SetEmoji(result.status)} #{result.message}" for result in check_results).join("\n")
          # console.log message
          send_msg message
    )

check_disk_space = (callback) ->
  data = {}
  command = "df -h"
  child_process.exec("#{command}", (err, stdout, stderr) ->
    if err
      send_msg err
    else
      for i in [85..100]
        if stdout.indexOf("#{i}%") != -1
          data = {
            status: false,
            message:"Disk space details for *localhost* is *#{OkorNot(false)}*\n```#{stdout}```"
          }
          break
        else
          data = {
            status: true,
            message:"Disk space details for *localhost* is *#{OkorNot(true)}* \n```#{stdout}```"
          }
            
      callback null,data
    )
OkorNot = (status) ->
  if status then "OK"
  else "NOT OK"

SetEmoji = (status) ->
  if status then ":heavy_check_mark:"
  else ":x:"