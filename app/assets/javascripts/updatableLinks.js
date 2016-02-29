function updateableLinks() {
  $(".update").on("click", function(link) {
    var $updateLink = $(this)

    updateLink($updateLink);
  });
}

function updateLink($updateLink) {
  var $link = $updateLink.prev();
  var id = $updateLink.attr("data-id");
  var updateReadTo = $updateLink.attr("data-update-to");

  $.ajax({
    url: "/api/v1/links/" + id + ".json",
    method: "PUT",
    data: { link: { read: updateReadTo } },
    success: function () {
      changeLinks($link, $updateLink, updateReadTo);
    }
  });
}

function changeLinks($link, $updateLink, updateReadTo) {
  if (updateReadTo == "true") {
    $updateLink.attr("data-update-to", "false").text("Mark as unread");
    $link.removeClass("unread").addClass("read");
  } else {
    $updateLink.attr("data-update-to", "true").text("Mark as read");
    $link.removeClass("read").addClass("unread");
  }
}
