$(document).ready(function () {

    $('.notificate').popover({
        html: true,
        placement: 'bottom',
        content: function () {
            return details_in_popup();
        }
    });

//  下拉隐藏导航栏，上滚显示导航栏
//     var p = 0;
//     var t = 0;
//     $(window).scroll(function () {
//         p = $(window).scrollTop();
//         if (t <= p) {
//             $("#nbar").hide();
//         } else {
//             $("#nbar").show();
//         }
//         setTimeout(function () {
//             t = p;
//         }, 0);
//     });
});

function details_in_popup() {

    return $('#popover_content_wrapper').html();

}

$(".notificate").on('mouseleave', '.popover', function () {
    $(this).hide();
});

// 弹框显示的时候触发 getIems 方法
$('.notificate').on('show.bs.popover', function () {
    getIems("1-2-3", "/loadMoreCard");
});

$(document).on("click", ".questionBtn", function () {
    $(".followBtn svg:first-child").removeClass("PushNotifications-selectedTabIcon");
    $(".voteBtn svg:first-child").removeClass("PushNotifications-selectedTabIcon");
    $(".questionBtn svg:first-child").addClass("PushNotifications-selectedTabIcon");
    getIems("1-2-3", "/loadMoreCard");
})

$(document).on("click", ".followBtn", function () {
    $(".questionBtn svg:first-child").removeClass("PushNotifications-selectedTabIcon");
    $(".voteBtn svg:first-child").removeClass("PushNotifications-selectedTabIcon");
    $(".followBtn svg:first-child").addClass("PushNotifications-selectedTabIcon");
    getIems(4, "/loadMore");
});

$(document).on("click", ".voteBtn", function () {
    $(".questionBtn svg:first-child").removeClass("PushNotifications-selectedTabIcon");
    $(".followBtn svg:first-child").removeClass("PushNotifications-selectedTabIcon");
    $(".voteBtn svg:first-child").addClass("PushNotifications-selectedTabIcon");
    getIems(5, "/loadMore");
});

function getIems(type, url) {

    var loadingHtml = "<div class=\"spinner-border\" role=\"status\">\n" +
        "  <span class=\"sr-only\">Loading...</span>\n" +
        "</div>";
    $(".PushNotifications-list").html(loadingHtml);

    $.get({
        // 首先获取第一页数据
        url: url + "?periodNo=0&type=" + type,
        type: "get",
        dataType: 'json',
        success: function (response) {
            if (response.code == 1) {

                var dayList = response.dataBody;

                var fullHtml = "";

                for (var i = 0; i < dayList.length; i++) {
                    var day = dayList[i];
                    if (day.messageList.length == 0) {
                        continue;
                    }

                    var messages = day.messageList;
                    for (var j = 0; j < messages.length; j++) {
                        var message = messages[j];
                        var innerHtml = " <div class=\"PushNotifications-item\">\n" + message.messageContent + "</div>";
                        fullHtml += innerHtml;
                    }
                }

                $(".PushNotifications-list").html(fullHtml);
            } else if (response.code == 2) {

                var fullHtml = "<div class=\"EmptyState\">\n" +
                    "\t<div class=\"EmptyState-inner\">\n" +
                    "\t\t<svg width=\"150\" height=\"120\" viewbox=\"0 0 150 120\" class=\"EmptyState-image\" fill=\"curr" +
                    "entColor\"><path fill=\"#EBEEF5\" d=\"M46.76 78.71a1.895 1.895 0 0 0-1.378 2.092c.13.948.94 1.648 " +
                    "1.904 1.635h55.468a1.882 1.882 0 0 0 1.884-1.635c.13-.95-.46-1.846-1.367-2.09a8.61 8.61 0 0 " +
                    "1-6.4-7.872l-2.473-20.928c-.96-7.872-6.567-14.37-14.178-16.435l-.986-.267-.113-1.014c-.24-2.106-2.01-3.696-4.11-3.696s-3.87" +
                    " 1.59-4.104 3.696l-.114 1.014-.98.267c-7.61 2.063-13.22 8.563-14.18 16.43L53.15 70.84c-.2 3.74-2.79" +
                    " 6.926-6.393 7.87zm50.61-29.155l2.482 20.982c.127 2.562 1.817 4.654 4.19 5.276a4.895 4.895 0 0 1 3.568" +
                    " 5.397c-.336 2.446-2.434 4.26-4.876 4.227H47.306a4.883 4.883 0 0 1-4.896-4.227 4.897 4.897 0 0 1" +
                    " 3.58-5.4 5.614 5.614 0 0 0 4.17-5.168l2.49-21.093c1.068-8.77 7.135-16.06 15.46-18.7.807-3.11 3.615-5.35" +
                    " 6.9-5.35s6.094 2.24 6.9 5.35c8.325 2.64 14.393 9.93 15.46 18.7zm-16.417 38.91c-.288 3.184-3.007 " +
                    "5.36-5.943 5.36-2.936 0-5.655-2.176-5.943-5.36l-2.988.27c.43 4.82 4.52 8.09 8.93 8.09s8.49-3.27 " +
                    "8.93-8.09l-2.99-.27z\"></path></svg>还没有消息\n" +
                    "\t</div>\n" +
                    "</div>";

                $(".PushNotifications-list").html(fullHtml);
            }
        }
    });

}

$(".PushNotifications-header")

// ------------------提问框校验-----------------------------
/* Latest compiled and minified JavaScript included as External Resource */
// 题目名称提醒
$('#questionTitle').tooltip({
    title: "输入问题名称",
    trigger: "manual"
});

// 题目详情提醒
// $('#questionContent').tooltip({
//     title: "输入问题详情",
//     trigger: "manual"
// });
//
// // 题目相关话题提醒
// $('#topic').tooltip({
//     title: "输入问题相关的话题",
//     trigger: "manual"
// });

// Manually hide tooltip when re-clicking the input
// This can be modified to hide the tooltip whenever you see fit
$("#questionTitle").click(function (e) {
    $(this).tooltip("hide");
});
// $("#questionContent").click(function (e) {
//     $(this).tooltip("hide");
// });
// $("#topic").click(function (e) {
//     $(this).tooltip("hide");
// });

function getChosedTopics() {
    var topicStrings = "";
    var root = $('#ask-topic-list').children();
    var i;
    for (i = 0; i < root.length; i++) {
        var temp = root[i].children[0].text + ",";
        topicStrings += temp;
    }
    return topicStrings;

}


$('#exampleModal').on('shown.bs.modal', function () {
    $("#questionTitle").focus();
})

$(document).keyup(function (e) {
    if ($("#keyword").is(":focus") && (e.keyCode == 13)) {
        var keyWord = $('#keyword').val();
        if (keyWord != null && keyWord.length > 0) {
            // window.location.href = '/search/question/' + keyWord;
            window.location.href = '/search?keyword=' + keyWord + '&type=question&page=1';
        } else {
            $.notify({
                // options
                message: '请输入搜索词'
            }, {
                type: 'info',
                placement: {
                    from: "top",
                    align: "center"
                },
                offset: 10,
                spacing: 10,
                z_index: 1031,
                delay: 3000,
                timer: 1000,
                animate: {
                    enter: 'animated fadeInDown',
                    exit: 'animated fadeOutUp'
                },
                onShow: function () {
                    this.css({'width': '150px', 'height': 'auto'});
                },
            });
        }
    }
});


/*提问表单处理*/
/* 提问处理 */

// $("#askBtn").on("click", function () {
function submitQuestion(questionTitle, questionContent, topicString) {
    var formData = {
        "questionTitle": questionTitle,
        "questionContent": questionContent,
        "topicString": topicString
    };

    $.ajax({
        url: "/addQuestion/",
        type: "post",
        data: formData,
        dataType: 'json',
        success: function (response) {
            if (response.code == 1) {
                window.location.href = "/question/" + response.dataBody;
            } else {
                alert("出现了错误...");
            }
        }
    });
}


/* 关键字搜索处理 */
$("#searchBtn").on("click", function () {

    var keyWord = $('#keyword').val();
    if (keyWord != null && keyWord.length > 0) {
        window.location.href = '/search?keyword=' + keyWord + '&type=question&page=1';
    } else {
        $.notify({
            // options
            message: '请输入搜索词'
        }, {
            type: 'info',
            placement: {
                from: "top",
                align: "center"
            },
            offset: 10,
            spacing: 10,
            z_index: 1031,
            delay: 3000,
            timer: 1000,
            animate: {
                enter: 'animated fadeInDown',
                exit: 'animated fadeOutUp'
            },
            onShow: function () {
                this.css({'width': '150px', 'height': 'auto'});
            },
        });
    }
});

// ------------------------返回顶部按钮----------------------------------------
window.onscroll = function () {
    scrollFunction()
};

function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        document.getElementById("myBtn").style.display = "block";
    } else {
        document.getElementById("myBtn").style.display = "none";
    }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction(event) {

    var target = '#myBtn';
    $('html, body').animate({
        scrollTop: 0
    }, 1000);

}

$(".nomore-hint").on("click", function () {
    $("#preference-hint").hide();
});

//后置增强Ajax方法
$.ajaxSetup({
    statusCode: {
        // 499 代表未登录用户进行了需要token的操作
        499: function (data) {
            //这里我写.parent.因为我的页面是在iframe中的
            $('#loginModal').modal('toggle');
            var currentUrl = $(".login-btn")[0].id;
            $("#loginButton").val(currentUrl);
            // window.parent.location.href = data.responseText;
        }
    }
});

$(".toLogin").on("click", function () {
    $("#registerModal").modal("toggle");
    $("#loginModal").modal("toggle");
});

$(".toRegister").on("click", function () {
    $("#loginModal").modal("toggle");
    $("#registerModal").modal("toggle");
});