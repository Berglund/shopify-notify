# Description:
#   Catches Shopify 'Order Creation' Webhooks and posts a message in chat room
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_SHOPIFY_NOTIFY_ROOM, HUBOT_SHOPIFY_ADMIN_URL
#
# Commands:
#   None
#
# Notes:
#   Set up web hook at Shopify settings.
#
# Author:
#   Berglund

module.exports = (robot) ->
  robot.router.post "/shopify/order_creation", (req, res) ->

    user = robot.brain.userForId 'broadcast'
    user.room = process.env.HUBOT_SHOPIFY_NOTIFY_ROOM
    user.type = 'groupchat'

    robot.send user, "New #{req.body.total_price} #{req.body.currency} order from #{req.body.billing_address.country}! #{process.env.HUBOT_SHOPIFY_ADMIN_URL}/orders/#{req.body.id}"

    res.writeHead 200, {'Content-Type': 'text/plain'}
    res.end 'Over and out'