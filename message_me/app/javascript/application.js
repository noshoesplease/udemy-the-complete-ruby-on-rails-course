// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers"

import * as jquery from "jquery";
import "semantic-ui";
import "channels";
import { scrollToBottom } from "util"

$(document).on("turbo:load", function () {
  $(".ui.dropdown").dropdown();
  $(".message .close").on("click", function () {
    $(this).closest(".message").transition("fade");
  });

  scrollToBottom();

  $(".ui.reply.form").on("submit", function (event) {
    event.preventDefault();
    
    const messageBody = $(this).find("input[name='message[body]']");
    $.post($(this).attr("action"), $(this).serialize(), function () {
      messageBody.val(""); // Clear the message input after sending
    });
    messageBody.val(""); // Clear the message input after sending
  });
});
