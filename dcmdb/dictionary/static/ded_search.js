/*
 * Primary Data Element Dictionary (DED) search functionality
 */
$(function() {

    /*
     * Search key up variables
     */
    var timer;
    var search_delay = 500;
    /*
     * Initiate Handlebars templating:
     * Grab HTML inside the handlerbars' script tag
     * and prepare it for DOM injection as a template
     */
    var de_pager_template = Handlebars.compile($("#de_pages").html());
    var de_template = Handlebars.compile($("#de_results").html());
    /*
     * Tooltips for data elements
     */
    var popover_defaults = {
        "placement": "auto",
        "trigger": "hover",
    };

    /*
     * Primary search event handler:
     * If the amount of time to sleep the setTimeout function triggers
     * then the clearTimeout will not have a chance to activate again
     */
    $("#query").on("keyup", function(e) {
        window.clearTimeout(timer);
        timer = setTimeout(function() {
            get_data_elements();
        }, search_delay);
    });

    /*
     * Clear results event handler
     */
    $("#de_clear").on("click", function(e) {
        e.preventDefault();
        $("#de_final_results").html("");
        $("#de_no_results").html("");
        $(".de-pager").html("");
        $("#query").val("");
        $("#de_info").show();
    });

    /*
     * Primary pagination click functionality
     */
    $("body").on("click", ".pagination > li", function(e) {
        e.preventDefault();

        // do nothing when a disabled page element has been clicked
        if ($(this).hasClass("disabled")) {
            return;
        }

        // if a page number has been clicked, grab page data
        var page = parseInt($(this).find("a").text());
        if (!isNaN(page)) {
            get_data_elements(page);
            return;
        }

        // find the currently active page
        var cur_page = 1;
        $(".pagination > li").each(function(index) {
            if ($(this).hasClass("active")) {
                cur_page = parseInt($(this).find("a").text());
            }
        });

        // if a forward or back button has been pressed,
        // calculate the next or previous page
        if ($(this).hasClass("de-pager-back")) {
            get_data_elements(cur_page - 1);
        } else {
            get_data_elements(cur_page + 1);
        }
    });

    /*
     * Primary data grabbing function
     */
    function get_data_elements(page) {
        if (typeof page == "undefined") {
            page = 1;
        }

        var query = $("#query").val();
        if (query == "") {
            return;
        }

        $.ajax({
            "url": "/dictionary/query/",
            "type": "GET",
            "dataType": "json",
            "data": {
                "query": query,
                "page": page
            },
            "success": function(data) {
                //console.log(data);
                var data_elements = data.data_elements;
                if (data_elements.length > 0) {
                    $("#de_no_results").hide();
                    // apply pagination template
                    if (data.hasOwnProperty("pages")) {
                        if (data.pages.length > 1) {
                            var de_pager = de_pager_template({
                                "pages": data.pages
                            });
                            $(".de-pager").html(de_pager);
                            set_active_page(page);
                        } else {
                            $(".de-pager").html("");
                        }
                    }

                    // apply data element results template
                    var de_content = de_template(data);
                    $("#de_final_results").html(de_content);

                    $("#de_info").hide();
                    var res_content = data.num_results +
                                      " data elements found! " +
                                      " Hover the <i class='fa fa-info-circle'></i>" +
                                      " icon to get information on data element property";
                    $("#de_num_results").html(res_content);

                    // Override any default popover settings
                    // and activate popovers
                    // Note: I hate settings new event handlers on AJAX success
                    //  but I cannot set a popover select for 4 popovers on one
                    //  DOM element, such as "body"
                    $(".de-name").popover($.extend(popover_defaults, {
                        "title": "Name",
                        "content": "The name of the data element."
                    }));

                    $(".de-tag").popover($.extend(popover_defaults, {
                        "title": "Tag",
                        "content": "A unique identifier for a Data Element " +
                                   "composed of an ordered pair of numbers " +
                                   "(a Group Number followed by an Element Number)."
                    }));

                    $(".de-vm").popover($.extend(popover_defaults, {
                        "title": "Value Multiplicity",
                        "content": "Specifies the number of Values contained " +
                                   "in the Value Field of a Data Element."
                    }));

                    $(".de-vr").popover($.extend(popover_defaults, {
                        "title": "Value Representation",
                        "content": "Specifies the data type and format of " +
                                   "the Value(s) contained in the Value Field of a Data Element."
                    }));

                    $(".de-status").popover($.extend(popover_defaults, {
                        "title": "Status",
                        "content": "Current staus of data element. " +
                                   "'RET' is used to indicate that the " +
                                   "corresponding Data Element, SOP Class, " +
                                   "or Transfer Syntax has been retired. " +
                                   "'DICOS' stands for Digital Imaging and " +
                                   "Communication for Security. " +
                                   "'DICONDE' stands for Digital Imaging and " +
                                   "Communication in Nondestructive Evaluation"
                    }));

                    $(".de-type").popover($.extend(popover_defaults, {
                        "title": "Type",
                        "content": "Specifies the different registry the data " +
                                   "element was obtained from."
                    }));
                } else {
                    $(".de-pager").html("");
                    $("#de_final_results").html("");
                    $("#de_info").hide();
                    $("#de_no_results").show();
                }
            }
        });
    };

    /*
     * Set the active page and determine if page is first or last
     */
    function set_active_page(page) {
        var page_length = $(".pagination > li").length / 2;

        if (page == 1) {
            $(".de-pager-back").addClass("disabled");
        } else if (page == page_length - 2) {
            $(".de-pager-forward").addClass("disabled");
        }

        $(".pagination > li").each(function() {
            $(this).removeClass("active");
            if (parseInt($(this).find("a").text()) == page) {
                $(this).addClass("active");
            }
        });
    };

});