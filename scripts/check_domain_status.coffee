# Description
#   Checks the free disk space on each server in the server group specified
#
# Commands:
#   akbot check my webiste health
# Author:
#  Amar Khan <amarkotasky@gmail.com>

async = require 'async'
mysiteurl="amarkhan.co.in"

module.exports = (robot) ->
  robot.respond /check my webiste health/, (msg) ->
    msg.reply "Here you go..."
    send_msg = (msgText) -> msg.send msgText

    if true # request_user == "amar.khan"
      robot.emit 'mysite:health:check',mysiteurl,send_msg
    else
      send_msg "`#{request_user}` Does not have `privillage` to do this opration"
      

  robot.on 'mysite:health:check', (mysiteurl,send_msg) ->
    robot.http("http://#{mysiteurl}")
      .header('Authorization', 'Basic xxxxxxxxxxxxxxxxxxxxxxxxxxxxx') # Add token here
      .get() (err,response,body) ->
        if err
          console.log err
        else
          status = response.statusCode is 200
          if status
            send_msg "Website <http://#{mysiteurl}|MySite> Health statuscode `#{response.statusCode}` "
