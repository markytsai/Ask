$(document).ready(function () {

    $('#summernote').summernote();

    var isColleced = $('#collectBtnValue').val();
    if (isColleced == '收藏') {
        $('#collectSymbol').addClass("glyphicon glyphicon-star");
    } else {
        $('#collectSymbol').addClass("glyphicon glyphicon-star-empty");
    }

    getAnswerId();

    // $('#afterAnswerCard').style.display = "none";
});

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
                // alert("赞同回答");
                $.notify(response.message);
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
                $.notify(response.message);
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
                $.notify(response.message);

                // $.notify('hello !!', {
                //     style: 'happyblue'
                // });
            } else {
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
                $('#answerContent').text(answerContent);
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
