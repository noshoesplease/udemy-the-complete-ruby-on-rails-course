import consumer from "channels/consumer";
import { scrollToBottom } from "util";

consumer.subscriptions.create("ChatroomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const chatFeed = document.querySelector(".ui.feed");
    chatFeed.insertAdjacentHTML("beforeend", data);
    scrollToBottom();
  },
});
