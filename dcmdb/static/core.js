//external links drop into a new tab
$.expr[':'].external = function(obj) {
	return !obj.href.match(/^mailto\:/)
		&& (obj.hostname != location.hostname)
		&& !obj.href.match(/^javascript\:/)
		&& !obj.href.match(/^$/);
};

$(function() {
    $("a:external").each(function() {
        var link_text = $(this).html() + ' <span class="glyphicon glyphicon-new-window"></span>';
        $(this).html(link_text);
    });
	$('a:external').attr('target', '_blank');
});
