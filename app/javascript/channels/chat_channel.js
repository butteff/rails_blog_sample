import consumer from "channels/consumer"

consumer.subscriptions.create({ channel: "ChatChannel", room: "chat_test" }, {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log('Connected to websockets')
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log('Disconnected from websockets')
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    // just a plain js here because I am learning ruby, don't want to use js frameworks over it here
    console.log(data) 
    let tr = document.createElement("tr")
    let td_username = document.createElement("td")
    let td_message = document.createElement("td")
    td_username.append(data.username)
    tr.append(td_username)
    td_message.append(data.body)
    tr.append(td_message)
    let chat = document.getElementById('chat')
    chat.append(tr)
  }
});
