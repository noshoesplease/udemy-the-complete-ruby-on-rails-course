function scrollToBottom() {
  if ($("#messages").length > 0) {
    $("#messages").scrollTop($("#messages")[0].scrollHeight);
  }
}

export { scrollToBottom };
