// $(document).ready(function () {
//
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
// });


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