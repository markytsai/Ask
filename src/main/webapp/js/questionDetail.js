$(document).ready(function () {


    $('#summernote').summernote();

    var isColleced = $('#collectBtnValue').val();
    if (isColleced == '收藏') {
        $('#collectSymbol').addClass("glyphicon glyphicon-star");
    } else {
        $('#collectSymbol').addClass("glyphicon glyphicon-star-empty");
    }

    getAnswerId();

    $('.example-popover').popover({
        container: 'body'
    })


    // $('#afterAnswerCard').style.display = "none";
});

$('.dropdown').on("click", function (e) {
    e.target.nextElementSibling.classList.toggle('show');
});

// Close the dropdown if the user clicks outside of it
window.onclick = function (event) {
    if (!event.target.matches('.icon-ellipsis-horizonta')) {
        var dropdowns = document.getElementsByClassName("dropdown-content");
        var i;
        for (i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.classList.contains('show')) {
                openDropdown.classList.remove('show');
            }
        }
    }
}


function getAnswerId() {
    $.ajax({
        url: "/getAnswerId/" + $('#getQuestionId').val(),
        type: "get",
        dataType: 'json',
        success: function (response) {
            if (response.state == 1) {
                var answerId = response.data;
                // 该问题还没有回答
                if (answerId == 0) {
                } else {
                    $("#modifyAfterAnswerBtn").attr("data-id", answerId);// 回答下面的修改链接
                    $("#iWantAnswer").attr("data-id", answerId);// 我要回答按钮
                    $('#answerContent').text($('#answerId-' + answerId).prev().prev().children().text());
                }
            }
        }
    });

}


$('#focusQuestion').click(function () {
    var btnFocusQuestion = $("#focusQuestion");
    followQuestion();
    // 取消关注问题
    if (btnFocusQuestion.text() == '关注问题') {
        btnFocusQuestion.text('取消关注');

    } else {
        btnFocusQuestion.text('关注问题');
    }
    btnFocusQuestion.blur();
});

// 点击我要回答按钮事件，显示内容输入框
$('#iWantAnswer').click(function (event) {


    // 这里需要拿到answerId
    if ($('#iWantAnswer').text() == '修改回答') {

        if ($('#authorEditting').css('display') == "block") {
            return;
        }

        var questionId = $('#getQuestionId').val();
        var answerId = $("#iWantAnswer").attr("data-id");

        // event.target.parentNode.parentNode.nextElementSibling.style.display = "none";
        // $('#answerId-' + answerId).parentNode.hide();
        // $('.answerArea').attr('data-id', answerId);
        $('#answerId-' + answerId).closest('.card-block').hide();

        var existedAnswerContent = event.target.parentNode.parentNode.previousElementSibling.textContent;

        if ($('#afterAnswerCard').css('display') == "block") { // 在上方暂时显示框的情况下点击修改回答按钮
            $('#afterAnswerCard').hide();
            $('.answerArea').summernote('code', $('#answerContent').text());
        } else {// 点击的是回答详情中的修改链接
            $('.answerArea').summernote('code', $('#answerId-' + answerId).prev().prev().children().text());


            $('#upvoteCountAfter').val($('#answerId-' + answerId));
        }

        $('#submitAnswer').text("更新回答");
    }


    $('.answerArea').summernote({focus: true});
    $('#submitBtn').show();
    $('#authorEditting').show();

})
;

// $('#submitAnswer').click(function () {
//     $('#editFrame').hide();
// });

$('#quitAnswer').click(function () {
    $('.answerArea').summernote('destroy');
    $('#submitBtn').hide();
    $('#authorEditting').hide();

    var answerId = $("#iWantAnswer").attr("data-id");

    if ($('#answerId-' + answerId).length == 1) {  // 取消回答后，要把更新的回答内容设置到即将显示出来的回答详情card中
        $('#answerId-' + answerId).closest('.card-block').show();
        var answerContent = $('#answerContent').text();
        if ($('#answerId-' + answerId).prev().prev().children().text() != answerContent) {
            $('#answerId-' + answerId).prev().prev().children().text(answerContent);
        }
        $('.answerArea').hide();
    } else {
        if ($('#answerId-' + answerId).css(display) == "none") {
            $('#afterAnswerCard').show();
            var answerContent = $('#answerContent').text();
            $('#answerId-' + answerId).closest('.hideContent').text(answerContent);
        }
    }


});

$('.glyphicon-thumbs-up').click(function (event) {
    var id = event.target.parentNode.id;

    var answerId;
    var userVote; // 是否已经投票：-1：反对；0：未投票；1：赞成
    var upvoteCount; // 赞成数量
    var downvoteCount; // 反对数量

    if ($('#afterAnswerCard').css('display') == "block") {
        answerId = $("#iWantAnswer").attr("data-id");
        userVote = $('#userVoteAfter').val(); // 是否已经投票：-1：反对；0：未投票；1：赞成
        upvoteCount = +$('#upvoteCountAfter').val(); // 赞成数量
        downvoteCount = +$('#downvoteCountAfter').val(); // 反对数量

        if (userVote == 1) { // 已经赞成了答案
            $('#userVoteAfter').val(0);
            $('#upvoteCountAfter').val(upvoteCount - 1);
            $('#upvoteIconAfter').text('赞同' + (upvoteCount - 1) + '次');
        } else if (userVote == 0) { // 还未投票
            $('#userVoteAfter').val(1);
            $('#upvoteCountAfter').val(upvoteCount + 1);
            $('#upvoteIconAfter').text('已赞同' + (upvoteCount + 1) + '次');
        } else { // 反对答案
            $('#userVoteAfter').val(1);
            $('#upvoteCountAfter').val(upvoteCount + 1);
            $('#downvoteCount').val(downvoteCount - 1);
            $('#upvoteIconAfter').text('已赞同' + (upvoteCount + 1) + '次');
            $('#downvoteIconAfter').text('反对' + (downvoteCount - 1) + '次');
        }

    } else {
        answerId = id.split('-')[1];
        userVote = $('#userVote', '#' + id).val(); // 是否已经投票：-1：反对；0：未投票；1：赞成
        upvoteCount = +$('#upvoteCount', '#' + id).val(); // 赞成数量
        downvoteCount = +$('#downvoteCount', '#' + id).val(); // 反对数量

        if (userVote == 1) { // 已经赞成了答案
            $('#userVote', '#' + id).val(0);
            $('#upvoteCount', '#' + id).val(upvoteCount - 1);
            $('#upvoteIcon', '#' + id).text('赞同' + (upvoteCount - 1) + '次');
        } else if (userVote == 0) { // 还未投票
            $('#userVote', '#' + id).val(1);
            $('#upvoteCount', '#' + id).val(upvoteCount + 1);
            $('#upvoteIcon', '#' + id).text('已赞同' + (upvoteCount + 1) + '次');
        } else { // 反对答案
            $('#userVote', '#' + id).val(1);
            $('#upvoteCount', '#' + id).val(upvoteCount + 1);
            $('#downvoteCount', '#' + id).val(downvoteCount - 1);
            $('#upvoteIcon', '#' + id).text('已赞同' + (upvoteCount + 1) + '次');
            $('#downvoteIcon', '#' + id).text('反对' + (downvoteCount - 1) + '次');
        }
    }


    $.ajax({
        url: "/voteAnswer/" + answerId,
        type: "post",
        data: {"userVote": userVote, "upOrDownClick": 1},
        dataType: 'json',
        success: function (response) {
            if (response.state == 1) {
                $.notify({
                    // options
                    message: response.message
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
                        this.css({'width': '200px', 'height': 'auto'});
                    },
                });
            }
        }
    });
});

$('.glyphicon-thumbs-down').click(function (event) {

    var id = event.target.parentNode.id;
    var answerId = id.split('-')[1];
    var userVote = $('#userVote', '#' + id).val(); // 是否已经投票：-1：反对；0：未投票；1：赞成
    var upvoteCount = +$('#upvoteCount', '#' + id).val(); // 赞成数量
    var downvoteCount = +$('#downvoteCount', '#' + id).val(); // 反对数量
    if (userVote == 1) { // 已经赞成了答案

        $('#userVote', '#' + id).val(-1);
        $('#upvoteCount', '#' + id).val(upvoteCount - 1);
        $('#downvoteCount', '#' + id).val(downvoteCount + 1);

        $('#upvoteIcon', '#' + id).text('赞同' + (upvoteCount - 1) + '次');
        $('#downvoteIcon', '#' + id).text('已反对' + (downvoteCount + 1) + '次');


    } else if (userVote == 0) { // 还未投票
        $('#userVote', '#' + id).val(-1);
        $('#downvoteCount', '#' + id).val(downvoteCount + 1);
        $('#downvoteIcon', '#' + id).text('已反对' + (downvoteCount + 1) + '次');
    } else { // 反对答案
        $('#userVote', '#' + id).val(0);
        $('#downvoteCount', '#' + id).val(downvoteCount - 1);
        $('#downvoteIcon', '#' + id).text('反对' + (downvoteCount - 1) + '次');
    }

    $.ajax({
        url: "/voteAnswer/" + answerId,
        type: "post",
        data: {"userVote": userVote, "upOrDownClick": -1},
        dataType: 'json',
        success: function (response) {
            if (response.state == 1) {
                $.notify({
                    // options
                    message: response.message
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
                        this.css({'width': '200px', 'height': 'auto'});
                    },
                });
            } else {
            }
        }
    });
});

$('.glyphicon-star, .glyphicon-star-empty').click(function (event) {
    var id = event.target.parentNode.id;
    var answerId = id.split('-')[1];
    var isCollect = $('#isCollect', '#' + id).val(); // 是否已经收藏

    if (isCollect == "false") {
        $('#isCollect', '#' + id).val(true);
        $('#collectBtnValue', '#' + id).text("已收藏");
        // event.target.parentNode.childNodes[11].switchClass("glyphicon-star-empty", "glyphicon-star");
        $('#' + answerId + 'star').switchClass("glyphicon-star-empty", "glyphicon-star");
    } else {
        $('#isCollect', '#' + id).val(false);
        $('#collectBtnValue', '#' + id).text("收藏");
        // event.target.parentNode.childNodes[11].switchClass("glyphicon-star", "glyphicon-star-empty");
        $('#' + answerId + 'star').switchClass("glyphicon-star", "glyphicon-star-empty");
    }
    $.ajax({
        url: "/collectAnswer/" + answerId,
        type: "get",
        data: {"isCollect": isCollect},
        dataType: 'json',
        success: function (response) {
            if (response.state == 1) {
                $.notify({
                    message: response.message
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
                        this.css({'width': '200px', 'height': 'auto'});
                    },
                });
            } else {
                $.notify({
                    // options
                    message: response.message
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
                        this.css({'width': '200px', 'height': 'auto'});
                    },
                });
            }
        }
    });
});


$('.delConfirmBtn').click(function (event) {

    var answerId = $('.delConfirmBtn').val();

    answerId = $('#iWantAnswer').data('id');
    if ($('#afterAnswerCard').css('display') == "block") {
        $('#afterAnswerCard').hide();
    }

    $('#delConfirmModal').modal('toggle');
    if ($('#answerId-' + answerId).length == 1) {
        $('#answerId-' + answerId)[0].parentNode.parentNode.hidden = true;
    }


    $.ajax({
        url: "/deleteAnswer/" + answerId,
        type: "get",
        dataType: 'json',
        success: function (response) {
            if (response.state == 1) {
                $('#iWantAnswer').text('我要回答');
            } else {
            }
        }
    });
});

$('.delBtn').click(function (event) {

    var id = event.target.parentNode.id;
    var answerId = id.split('-')[1];

    var deletedAnswerId = answerId;
    $(".modal-footer #delId").val(deletedAnswerId);
});

function followQuestion() {

    var questionId = $('#getQuestionId').val();

    $.ajax({
        url: "/followQuestion/" + questionId,
        type: "get",
        dataType: 'json',
        success: function (response) {
            if (response.state == 1) {
            } else {
            }
        }
    });
}

// 回答内容完毕，准备提交到服务器
$('#submitAnswer').click(function () {

    var answerContent = $('.answerArea').summernote('code');
    var questionId = $('#getQuestionId').val();
    $('.answerArea').summernote('destroy');
    $('#submitBtn').hide();
    $('#authorEditting').hide();
    $('.answerArea').hide();

    if ($('#submitAnswer').text() == '更新回答') {
        updateAnswer(answerContent, questionId, $('#iWantAnswer').attr('data-id'));

    } else {
        submitFirstAnswer(answerContent, questionId);
    }


});

// 点击更新回答，提交新的内容
function updateAnswer(answerContent, questionId, answerId) {

    $.ajax({
        url: "/updateAnswer/" + questionId,
        type: "post",
        data: {'answerContent': answerContent, "questionId": questionId, "answerId": answerId},
        dataType: 'json',
        success: function (response) {
            if (response.state == 1) {
                $('#answerContent').text(answerContent);
                $('#afterAnswerCard').show();


                // 暂时展示，要保证投票数，收藏和更新答案之前的数据一致


                var isCollectedAfter = $('#answerId-' + answerId).children()[0].value;
                var isUserVoteAfter = $('#answerId-' + answerId).children()[1].value;// 是否已经投票：-1：反对；0：未投票；1：赞成
                var upVoteCountAfter = $('#answerId-' + answerId).children()[2].value;
                var downVoteCountAfter = $('#answerId-' + answerId).children()[3].value;
                $('#userVoteAfter').val(isUserVoteAfter);
                $('#upvoteCountAfter').val(upVoteCountAfter);
                $('#downvoteCount').val(downVoteCountAfter);

                if (isUserVoteAfter == 1) { // 已经赞成了答案
                    $('#upvoteIconAfter').text('已赞同' + (upVoteCountAfter) + '次');
                    $('#downvoteIconAfter').text('反对' + (downVoteCountAfter) + '次');
                } else if (isUserVoteAfter == 0) { // 还未投票
                    $('#upvoteIconAfter').text('赞同' + (upVoteCountAfter) + '次');
                    $('#downvoteIconAfter').text('反对' + (downVoteCountAfter) + '次');
                } else { // 反对答案
                    $('#upvoteIconAfter').text('赞同' + (upVoteCountAfter) + '次');
                    $('#downvoteIconAfter').text('已反对' + (downVoteCountAfter) + '次');
                }

                if (isCollectedAfter) { //如果已经收藏
                    $('#collectSymbol').switchClass("glyphicon-star-empty", "glyphicon-star");
                    $('#collectBtnValueAfter').text("已收藏");
                } else {
                    $('#collectSymbol').switchClass("glyphicon-star", "glyphicon-star-empty");
                    $('#collectBtnValueAfter').text("收藏");
                }


            } else {
            }
        }
    });
}

// 第一次提交回答
function submitFirstAnswer(answerContent, questionId) {
    $.ajax({
        url: "/submitAnswer/" + questionId,
        type: "post",
        data: {'answerContent': answerContent},
        dataType: 'json',
        success: function (response) {
            if (response.state == 1) {
                // 回答成功提交
                // $('#answerContent').text(answerContent);
                $('#answerContent').innerHTML = answerContent;
                $('#afterAnswerCard').show();
                $('#iWantAnswer').text('修改回答');
                $('#iWantAnswer').data('id', response.data);
                $('#modifyAfterAnswerBtn').data('id', response.data);
            } else {
            }
        }
    });


}

// 点击暂时显示框的修改，修改答案按钮,弹出修改文本框
$('#modifyAnswerBtn').click(function (event) {

    $('.answerArea').summernote({focus: true});
    $('#submitBtn').show();
    $('#authorEditting').show();

    // 隐藏已提交的回答
    event.target.parentNode.parentNode.parentNode.hidden = true;

    var questionId = $('#getQuestionId').val();
    var answerId = event.target.parentNode.parentNode.nextElementSibling.id.split('-')[1];

    // event.target.parentNode.parentNode.nextElementSibling.style.display = "none";
    // $('#answerId-' + answerId).parentNode.hide();
    $('.answerArea').attr('data-id', answerId);
    var existedAnswerContent = event.target.parentNode.parentNode.previousElementSibling.textContent;
    $('.answerArea').summernote('code', existedAnswerContent);

    $('#submitAnswer').text("更新回答");
});


// 点击修改答案按钮，显示的内容是前端直接获取，没有请求后台数据，弹出修改文本框
$('#modifyAfterAnswerBtn').click(function (event) {

    $('.answerArea').summernote({focus: true});
    $('#submitBtn').show();
    $('#authorEditting').show();

    var questionId = $('#getQuestionId').val();
    var answerId = $("#iWantAnswer").attr("data-id");
    // var answerId = event.target.parentNode.parentNode.nextElementSibling.id.split('-')[1];

    // event.target.parentNode.parentNode.nextElementSibling.style.display = "none";
    // $('#answerId-' + answerId).parentNode.hide();
    $('.answerArea').attr('data-id', answerId);
    var existedAnswerContent = event.target.parentNode.parentNode.previousElementSibling.textContent;
    $('.answerArea').summernote('code', existedAnswerContent);

    $('#submitAnswer').text("更新回答");

    $('#afterAnswerCard').hide();

});


$('.followUser').click(function (event) {

    var id = event.target.id;
    var userId = id.split('-')[1];

    if (event.target.innerText == '关注答主') {
        event.target.innerText = "已关注答主";
    } else {
        event.target.innerText = "关注答主";
    }

    $.ajax({
        url: "/followUser/" + userId,
        type: "get",
        dataType: 'json'
    });
});

function followQuestion() {

    var questionId = $('#getQuestionId').val();

    $.ajax({
        url: "/followQuestion/" + questionId,
        type: "get",
        dataType: 'json',
        success: function (response) {
            if (response.state == 1) {
            } else {
            }
        }
    });
}

$('.followHimclass').click(function (event) {
    var followStatus = $('.followHimclass:first-child').text().trim();
    if (followStatus == "取消关注") {
        $('.followHimclass').text('关注他');
    } else {
        $('.followHimclass').text('取消关注');
    }

    var id = event.target.id;
    var userId = id.split('-')[1];

    $.ajax({
        url: "/followUser/" + userId,
        type: "get",
        dataType: 'json',
        success: function (response) {
            if (response.state == 1) {
            } else {
            }
        }
    });
});

$('.modifyBtn').click(function (event) {

    var id = event.target.id;
    var userId = id.split('-')[1];

    window.location.href = "/settings";
});

$(".moreContent").on("click", function (event) {
    var id = event.target.id;

    var linkText = $('#' + id).parent().text();

    if (linkText === "展开") {
        $('#' + id).parent().parent().prev("div.foldContent:first-child").children().switchClass("hideContent", "showContent", 500);
        $('#' + id).parent().html("收起<span id='" + id + "' class='glyphicon glyphicon-menu-up'/>");
    } else {
        $('#' + id).parent().parent().prev("div.foldContent:first-child").children().addClass("hideContent").removeClass("showContent", 300);
        // $('#' + id).parent().text("更多");
        $('#' + id).parent().html("展开<span id='" + id + "' class='glyphicon glyphicon-menu-down'/>");
        // $('#' + id).parent().html("收起<span class='glyphicon glyphicon-menu-down'/>");
    }
});


// $('.avatarImg').bind("mouseenter", function (event) {
//     document.getElementById('personInfoCard').style.display = "block";
//
// });
//
// $('.avatarImg').bind("mouseover", function (event) {
//     document.getElementById('personInfoCard').style.display = "none";
// });


var readURL = function (input) {
    if (input.files) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('.profile-pic').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);

        var formData = new FormData();
        var name = $(".file-upload").val();
        formData.append("file", $("#upload")[0].files[0]);
        formData.append("name", name);
        $.ajax({
            url: "/uploadAvatar",
            type: "post",
            type: 'POST',
            data: formData,
            // 告诉jQuery不要去处理发送的数据
            processData: false,
            // 告诉jQuery不要去设置Content-Type请求头
            contentType: false,
            success: function (response) {
                if (response.state == 1) {
                } else {
                }
            }
        });
    }

}


$(".file-upload").on('change', function () {
    readURL(this);
});

$(".upload-button").on('click', function () {
    $(".file-upload").click();
});

$('.upload-button').mouseenter(function () {
    $('#changeAvatar').show();
}).mouseleave(function () {
    $('#changeAvatar').hide();
})


$(".avatarInfo").hover(function () {
        $(this).find('.avatarInfor').fadeIn(100);
        $(".p-image").show(200);
        $('.profile-pic').css('opacity', '0.5', 200);
    },

    function () {
        $(this).find('.avatarInfo').fadeOut(100);
        $(".p-image").hide(200);
        $('.profile-pic').css('opacity', '1');
    });

function setFloatingDivData(user) {
    $('.introduce').show();
    $('.avatarImgFloated').children().attr('href', '/userHome/activity/' + user.userId);
    $('.avatarImgFloated').children().children().attr('src', user.avatarUrl);
    $('.usernameFloat').children().children().children().attr('href', '/userHome/activity/' + user.userId);
    $('.usernameFloat').children().children().children().text(user.username);
    $('.desc').children().text(user.simpleDesc);
    $('.career').text('现从事于 ' + user.career);
    $('.position').text(user.position);
    $('.residencePlace').text('现居住在 ' + user.residencePlace);
    $('.education').text('教育程度 ' + user.education);

    if (user.followStatus == 1) { // 如果已经关注了，显示取消关注
        $('.follow').children().text('取消关注');
        $('.follow').switchClass('fa-plus', 'fa-check-square');
    } else {
        $('.follow').children().text('关注他');
        $('.follow').switchClass('fa-check-square', 'fa-plus');
    }

}

$(".avatarImg").hover(function () {
        $(".floatingCard").fadeIn(500);

        var topOffset = $(this).offset().top;
        var leftOffset = $(this).offset().left;
        $(".floatingCard").css({
            'top': topOffset + "px",
            'left': leftOffset + "px"
        });
        var userUrl = $(this).children().attr("href");
        var userId = userUrl.split('/')[3];

        $.ajax({
            url: "/getUser/" + userId,
            type: "get",
            dataType: 'json',
            success: function (response) {
                if (response.state == 1) {

                    var user = response.data.user;
                    if (user.userId != response.data.localUserId) {
                        setFloatingDivData(user);
                    } else {
                        $('.floatingCard').hide();
                    }
                } else {
                }
            }
        });
    },
    function () {
        $(".floatingCard").fadeOut();
    });

$(".avatarImgSided").hover(function () {
        $(".floatingCard").fadeIn(500);

        var topOffset = $(this).offset().top - 10;
        var leftOffset = $(this).offset().left;
        $(".floatingCard").css({
            'top': topOffset + "px",
            'left': leftOffset + "px"
        });
        var userUrl = $(this).children().attr("href");
        var userId = userUrl.split('/')[3];

        $.ajax({
            url: "/getUser/" + userId,
            type: "get",
            dataType: 'json',
            success: function (response) {
                if (response.state == 1) {

                    var user = response.data.user;
                    if (user.userId != response.data.localUserId) {
                        setFloatingDivData(user);
                    } else {
                        $('.floatingCard').hide();
                    }
                } else {
                }
            }
        });
    },
    function () {
        $(".floatingCard").fadeOut();
    });

function sleep(delay) {
    var start = new Date().getTime();
    while (new Date().getTime() < start + delay) ;
}

$('.comment-span').on('click', function (event) {
    if (event.target.parentNode.parentNode.nextElementSibling.style.display == "none") {
        $('#comment-' + event.target.parentNode.parentNode.id.split('-')[1]).fadeIn(2000);
        event.target.title = '点击折叠评论';
    } else {
        $('#comment-' + event.target.parentNode.parentNode.id.split('-')[1]).fadeOut(10);
        event.target.title = '点击展开评论';
    }
});

// $('.comment-span')
//
// $('.commentBtn').click(function () {
//     if (!$('.commentText').val()) {
//         $('.commentBtn').prop('disabled', true);
//     }
// });

// $(".commentText").keyup(function (event) {
//     if ($(this).val() == "") {
//         $('.commentBtn').attr("disabled", true);
//     } else {
//         $('.commentBtn').attr("disabled", null);
//     }
// });

$('.commentBtn').on('click', function (event) {
    var answerId = event.target.parentNode.parentNode.parentNode.id.split('-')[1];
    var commentContent = event.target.parentNode.previousElementSibling.children[0].children[0].value;
    event.target.parentNode.previousElementSibling.children[0].children[0].value = "";

    var formData = {
        "commentContent": commentContent,
        "answerId": answerId
    };

    $.ajax({
        url: "/commentAnswer",
        data: formData,
        type: "post",
        success: function (response) {
            if (response.state == 1) {

                var answerComment = response.data;

                var newCommentItem = "<div class=\"avatarImg\" style=\"float:left; width:35px; height:35px;margin-left: 0;\">\n" +
                    "    <a href=\"/userHome/activity/" + answerComment.user.userId + "\" target=\"_blank\">\n" +
                    "      <img src=\"" + answerComment.user.avatarUrl + "\" width=\"100%\" height=\"100%\" style=\"border-radius: 100%\" /></a>\n" +
                    "  </div>\n" +
                    "  <!--评论作者用户名和评论时间-->\n" +
                    "  <div class=\"commentAuthor\" style=\"margin-left: 45px\">\n" +
                    "    <div>\n" +
                    "      <h3 style=\"font-size: 15px;\">\n" +
                    "        <a href=\"/userHome/activity/" + answerComment.userId + "\" style=\"color: black;\" href=\"/userHome/activity/" + answerComment.user.userId + "\" class=\"card-link usernameLink\">" + answerComment.user.username + "</a>&nbsp;</h3>\n" +
                    "    </div>\n" +
                    "    <div class=\"desc\" style=\"margin-top: -7px;margin-right: 15px;\">\n" +
                    "      <span class=\"info-piece-fontsize\">" + "刚刚发表了评论" + "</span></div>\n" +
                    "  </div>\n" +
                    "  <!--详细评论内容-->\n" +
                    "  <div class=\"commentContent\" style=\"margin-top: 3px;display: flex;\">\n" +
                    "    <div class=\"verticalLine\" style=\"border-left: 1px solid #e6e6e6;margin-left: 17px;width: 29px;padding-right: 21px;\"></div>\n" +
                    "    <div style=\"padding-right: 15px;\">\n" +
                    "      <p>" + answerComment.answerCommentContent + "</p></div>\n" +
                    "  </div>\n" +
                    "  <div class=\"commentOpt\" style=\"margin-left: 46px;font-size: 1px;\">\n" +
                    "    <span class=\"replyComment\" style=\"cursor: pointer;\">" + "回复" + "</span>&nbsp;&nbsp;\n" +
                    "    <span class=\"delComment\" style=\"cursor: pointer;\">" + "删除" + "</span></div>";

                var div = document.createElement('div');
                div.setAttribute("id", answerComment.answerId + "-" + answerComment.answerCommentId + "-" + answerComment.atAnswerCommentId + "-" + answerComment.atUserId + "-" + answerComment.atUserName);
                div.innerHTML = newCommentItem;
                $('#comment-' + answerId).children()[1].prepend(div);
                // var commentListId = $('#comment-' + answerId).children[1];
                // $('#' + commentListId).appendChild(newCommentItem);

            } else {
            }
        }
    });
});



//删除评论按钮
$('.delComment').on("click", function (event) {

    var answerId = event.target.parentNode.parentNode.id.split('-')[0];
    var commentId = event.target.parentNode.parentNode.id.split('-')[1];
    var atAnswerCommentId = event.target.parentNode.parentNode.id.split('-')[2];
    var atUserId = event.target.parentNode.parentNode.id.split('-')[3];
    var atUserName = event.target.parentNode.parentNode.id.split('-')[4];

    var commentFullId = event.target.parentNode.parentNode.id;

    if (this.textContent == "删除") {
        // this.textContent = "还原";

        $(".modal-footer #delCommentId").val(commentFullId);
        // startTimer(10, this);
        // setTimeout(function () {
        //     document.getElementById("answer-" + answerId + "-comment-" + commentId).style.display = "none";
        // }, 10000);

    } else {
        this.textContent = "删除";
    }
});

// 删除评论弹出modal确认按钮
$('#delCommentId').on("click", function () {
    $('#delComment').modal('toggle');
    var commentId = $('#delCommentId').val();
    $.ajax({
        url: "/delComment/" + commentId.split('-')[3],
        type: "get",
        success: function (response) {
            if (response.state == 1) {

                document.getElementById(commentId).parentNode.removeChild(document.getElementById(commentId));
            }

        }
    });
});

$('.replyComment').on("click", function (event) {

    var id = event.target.parentNode.id;
    var answerId = event.target.parentNode.parentNode.id.split('-')[0];
    var commentId = event.target.parentNode.parentNode.id.split('-')[1];
    var atAnswerCommentId = event.target.parentNode.parentNode.id.split('-')[2];
    var atUserId = event.target.parentNode.parentNode.id.split('-')[2];
    var atUserName = event.target.parentNode.parentNode.id.split('-')[2];
    var replyTargetUserId = event.target.parentNode.parentNode.children[0].children[0].children[0].href.split("activity/")[1];

    $.ajax({
        url: "/getUser/" + replyTargetUserId,
        type: "get",
        dataType: 'json',
        success: function (response) {
            if (response.state == 1) {

                var user = response.data.user;

                var replyInputAreaDiv = "<div style=\"float: left;margin-right: 6px;\">\n" +
                    "    <img th:src=\"" + user.avatarUrl + "\" width=\"35px\" height=\"35px\" style=\"border-radius: 100%\" /></div>\n" +
                    "  <div style=\"float: left;margin-right: 6px;width: 68%;\">\n" +
                    "    <div class=\"form-group\">\n" +
                    "      <input class=\"form-control commentText\" value='@:" + user.username + "' autofocus='true'/></div>\n" +
                    "  </div>\n" +
                    "  <div style=\"float: left;margin-right: 15px;\">\n" +
                    "    <button class=\"btn btn-info replyBtn\">回复</button>\n" +
                    "</div>";

                var div = document.createElement('div');
                div.setAttribute("id", answerId + "-" + commentId + "-" + atAnswerCommentId + "-" + atUserId + "-" + atUserName);
                div.setAttribute("class", "makeCommentArea");
                div.setAttribute("style", "margin-top: 10px;margin-left: 47px;width: 110%;height: 35px;");
                div.innerHTML = replyInputAreaDiv;
                event.target.parentNode.parentNode.append(div);


            } else {
            }
        }
    });


});

//回复按钮
$('.replyBtn').on('click', function (event) {
    // 目标评论的具体信息
    var id = event.target.parentNode.parentNode.id;

    var commentContent = event.target.parentNode.previousElementSibling.children[0].children[0].value;
    event.target.parentNode.previousElementSibling.children[0].children[0].value = "";

    var formData = {
        "commentContent": commentContent,
        "id": id
    };

    $.ajax({
        url: "/replyComment",
        data: formData,
        type: "post",
        success: function (response) {
            if (response.state == 1) {

                var answerComment = response.data;

                var newCommentItem = "<div class=\"avatarImg\" style=\"float:left; width:35px; height:35px;margin-left: 0;\">\n" +
                    "    <a href=\"/userHome/activity/" + answerComment.user.userId + "\" target=\"_blank\">\n" +
                    "      <img src=\"" + answerComment.user.avatarUrl + "\" width=\"100%\" height=\"100%\" style=\"border-radius: 100%\" /></a>\n" +
                    "  </div>\n" +
                    "  <!--评论作者用户名和评论时间-->\n" +
                    "  <div class=\"commentAuthor\" style=\"margin-left: 45px\">\n" +
                    "    <div>\n" +
                    "      <h3 style=\"font-size: 15px;\">\n" +
                    "        <a href=\"/userHome/activity/" + answerComment.userId + "\" style=\"color: black;\" href=\"/userHome/activity/" + answerComment.user.userId + "\" class=\"card-link usernameLink\">" + answerComment.user.username + "</a>&nbsp;</h3>\n" +
                    "    </div>\n" +
                    "    <div class=\"desc\" style=\"margin-top: -7px;margin-right: 15px;\">\n" +
                    "      <span class=\"info-piece-fontsize\">" + "刚刚发表了评论" + "</span></div>\n" +
                    "  </div>\n" +
                    "  <!--详细评论内容-->\n" +
                    "  <div class=\"commentContent\" style=\"margin-top: 3px;display: flex;\">\n" +
                    "    <div class=\"verticalLine\" style=\"border-left: 1px solid #e6e6e6;margin-left: 17px;width: 29px;padding-right: 21px;\"></div>\n" +
                    "    <div style=\"padding-right: 15px;\">\n" +
                    "      <p>" + answerComment.answerCommentContent + "</p></div>\n" +
                    "  </div>\n" +
                    "  <div class=\"commentOpt\" style=\"margin-left: 46px;font-size: 1px;\">\n" +
                    "    <span class=\"replyComment\" style=\"cursor: pointer;\">" + "回复" + "</span>&nbsp;&nbsp;\n" +
                    "    <span class=\"delComment\" style=\"cursor: pointer;\">" + "删除" + "</span></div>";

                var div = document.createElement('div');
                div.setAttribute("id", answerComment.answerId + "-" + answerComment.answerCommentId + "-" + answerComment.atAnswerCommentId + "-" + answerComment.atUserId + "-" + answerComment.atUserName);
                div.innerHTML = newCommentItem;
                $('#comment-' + answerId).children()[1].prepend(div);
                // var commentListId = $('#comment-' + answerId).children[1];
                // $('#' + commentListId).appendChild(newCommentItem);

            } else {
            }
        }
    });
});


// function startTimer(duration, display) {
//     var start = Date.now(),
//         diff,
//         minutes,
//         seconds;
//
//     function timer() {
//         // get the number of seconds that have elapsed since
//         // startTimer() was called
//         diff = duration - (((Date.now() - start) / 1000) | 0);
//
//         // does the same job as parseInt truncates the float
//         // minutes = (diff / 60) | 0;
//         seconds = (diff % 60) | 0;
//
//         // minutes = minutes < 10 ? "0" + minutes : minutes;
//         seconds = seconds < 10 ? "0" + seconds : seconds;
//
//         display.textContent = "还原(" + seconds + ")";
//
//         if (diff <= 0) {
//             // add one second so that the count down starts at the full duration
//             // example 05:00 not 04:59
//             start = Date.now() + 1000;
//         }
//     };
//     // we don't want to wait a full second before the timer starts
//     // timer();
//     setInterval(timer, 1000);
// }