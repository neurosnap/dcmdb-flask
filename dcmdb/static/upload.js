$(function() {

    var source = $("#file_template").html();
    var template = Handlebars.compile(source);

    $(".file_rm_all").on("click", function() {
        $(".files tr").each(function() {
            $(this).remove();
        });
    });

    $(".start").on("click", function() {
        $(".file_up").click();
    });

    $('#fileupload').fileupload({
        "dataType": 'json',
        "add": function (e, data) {
            //console.log(data);
            var context = {
                "name": data.files[0].name,
                "size": bytesToSize(data.files[0].size),
                "type": data.files[0].type
            };
            var html = template(context);

            $(".files").append(html);

            $(".file_rm").eq(-1).on("click", function() {
                $(this).parent().parent().remove();
            });

            $(".file_up").eq(-1).on("click", function() {
                data.submit();
            });
        },
        "done": function (e, data) {
            console.log(data.result);
            $(".queued_file").each(function() {
                var name = $(this).find("td:first-child").text();
                for (var i = 0; i < data.files.length; i++) {
                    if (data.files[i].name == name) {
                        $(this).find(".progress").parent().html('<div><span class="glyphicon glyphicon-floppy-saved"></span></div>');
                        break;
                    }
                }
            });
            var found_img = false;
            $("#apt-gallery > img").each(function() {
                if ($(this).attr("src") == data.result.name) {
                    found_img = true;
                }
            });
            if (!found_img) {
                $("#apt-gallery").append('<img src="/uploads/' + data.result.name + '" class="img-thumbnail apt-photo">');
            }
        },
        "progress": function(e, data) {
            var progress = parseInt(data.loaded / data.total * 100, 10);
            $(".queued_file").each(function() {
                var name = $(this).find("td:first-child").text();
                for (var i = 0; i < data.files.length; i++) {
                    if (data.files[i].name == name) {
                        $(this).find(".progress-bar").css("width", progress + "%");
                        break;
                    }
                }
            });
        },
        "progressall": function (e, data) {
            var progress = parseInt(data.loaded / data.total * 100, 10);
            $('#progress_all .progress-bar').css('width', progress + '%');
        }
    });
});

function bytesToSize(bytes) {
    if (bytes == 0)
        return '0 Bytes';

    var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
    var i = parseInt(Math.floor(Math.log(bytes) / Math.log(1024)));

    return Math.round(bytes / Math.pow(1024, i), 2) + ' ' + sizes[i];
};