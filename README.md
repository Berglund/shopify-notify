# Hubot Shopify Script

This simple script catches a Shopify 'Order Creation' web hook and prints `New 239.94 USD order from United States! https://mystore.myshopify.com/admin/orders/12…` in a chat room. 

## Installing
Installing the shopify-notify script takes three steps:

#### Shopify Web Hook
Add a new JSON Web Hook for "Order Creation" in Shopify settings. Make it point to your hubot instance: `http://myhubot.herokuapp.com/shopify/order_creation`

#### Heroku environment variables
shopify-notify looks for `HUBOT_SHOPIFY_NOTIFY_ROOM` to tell it which room to post the message in, so set it on Heroku using the Heroku Toolbelt:

    heroku config:add HUBOT_SHOPIFY_NOTIFY_ROOM="my_room_id"

To be able to link to the order, it looks for `HUBOT_SHOPIFY_ADMIN_URL`:

    heroku config:add HUBOT_SHOPIFY_ADMIN_URL="https://myshop.myshopify.com/admin"

#### Hubot script installation
Put shopify-notify.coffee in the `scripts` folder. Reboot that Hubot!

#### Extend
See `example_hook_response.json`, it's example data pushed from Shopify for a 'Order Creation' hook.