function searchableLinks() {
  $("#search").keyup(function() {
    var filter = $(this).val().toLowerCase();
    filterLinks(filter);
  });
}

function filterLinks(filter) {
  var $links = $(".link");

  $.each($links, function(idx, link) {
    var title = $(link).attr("data-title").toLowerCase();

    if (!title.includes(filter)) {
      $(link).hide();
    } else {
      $(link).show();
    }
  });
}
