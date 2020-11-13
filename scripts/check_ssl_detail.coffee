# Description
#   Checks the free disk space on each server in the server group specified
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_ANSIBLE_INVENTORY
#
# Commands:
#   akbot check ssl status domain
# Author:
#  Amar Khan <amarkotasky@gmail.com>


module.exports = (robot) ->
  robot.respond /check ssl status (.*)/i, (msg) ->
    input_data = msg.match[1] || ""
    command = "echo | openssl s_client -connect #{input_data}:443 2>/dev/null | openssl x509 -noout -enddate"
    send_msg = (msgText) -> msg.send msgText
    msg.reply "Please Wait getting ssl details for *#{input_data.toUpperCase()}*"

    if not input_data
      msg.send """
      To call this command use the following syntax:
      ```
      #{robot.name} check ssl status dev
      ```
      """
    else
      child_process = require 'child_process'
      child_process.exec("#{command}", (err, stdout, stderr) ->
        if err
          send_msg err
        else
          send_msg "Your SSL for *#{input_data.toUpperCase()}* valid ```#{stdout}```"
        )
