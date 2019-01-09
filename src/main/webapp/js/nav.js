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
$(document).ready(function () {
    $('#exampleModal').on('shown.bs.modal', function () {
        $("#questionTitle").focus();
    })
});

$(document).keyup(function (e) {
    if ($("#keyword").is(":focus") && (e.keyCode == 13)) {
        var keyWord = $('#keyword').val();
        if (keyWord != null && keyWord.length > 0) {
            // window.location.href = '/search/question/' + keyWord;
            window.location.href = '/search?keyword=' + keyWord + '&type=question';
        } else {
            $.notify("请输入搜索词")
        }
    }
});


/*提问表单处理*/
/* 提问处理 */
$("#askBtn").on("click", function () {
    var formData = {
        "questionTitle": $("#questionTitle").val(),
        "questionContent": $("#questionContent").val(),
        "topicString": $("#topic").val()
    };

    $.ajax({
        url: "/addQuestion/",
        type: "post",
        data: formData,
        dataType: 'json',
        success: function (response) {
            if (response.state == 1) {
                window.location.href = "/question/" + response.data;
            } else {
                alert("出现了错误...");
            }
        }
    });
});

/* 关键字搜索处理 */
$("#searchBtn").on("click", function () {

    var keyWord = $('#keyword').val();
    if (keyWord != null && keyWord.length > 0) {
        window.location.href = '/search?keyword=' + keyWord + '&type=question';
    } else {
        $.notify("请输入搜索词")
    }
});

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