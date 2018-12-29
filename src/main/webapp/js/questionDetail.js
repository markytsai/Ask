$(document).ready(function () {

    $('#summernote').summernote();

    var isColleced = $('#collectBtnValue').val();
    if (isColleced == '收藏') {
        $('#collectSymbol').addClass("glyphicon glyphicon-star");
    } else {
        $('#collectSymbol').addClass("glyphicon glyphicon-star-empty");
    }
});


$('#focusQuestion').click(function () {
    var btnFocusQuestion = $("#focusQuestion");
    followQuestion();
    // 取消关注问题
    if (btnFocusQuestion.val() == '关注问题') {
        btnFocusQuestion.val('取消关注');

    } else {
        btnFocusQuestion.val('关注问题');
    }
    btnFocusQuestion.blur();
});

$('#iWantAnswer').click(function () {
    $('.answerArea').summernote({focus: true});
    $('#submitBtn').show();
    $('#authorEditting').show();

});

// $('#submitAnswer').click(function () {
//     $('#editFrame').hide();
// });

$('#quitAnswer').click(function () {
    $('.answerArea').summernote('destroy');
    $('#submitBtn').hide();
    $('#authorEditting').hide();
});

$('.glyphicon-thumbs-up').click(function (event) {
    var id = event.target.parentNode.id;
    var answerId = id.split('-')[1];
    var userVote = $('#userVote', '#' + id).val(); // 是否已经投票：-1：反对；0：未投票；1：赞成
    var upvoteCount = +$('#upvoteCount', '#' + id).val(); // 赞成数量
    var downvoteCount = +$('#downvoteCount', '#' + id).val(); // 反对数量
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

    $.ajax({
        url: "/voteAnswer/" + answerId,
        type: "post",
        data: {"userVote": userVote, "upOrDownClick": 1},
        dataType: 'json',
        success: function (response) {
            if (response.state == 1) {
                alert(response.data);
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
            } else {
            }
        }
    });
});

$('.glyphicon-star').click(function (event) {
    var id = event.target.parentNode.id;
    var answerId = id.split('-')[1];
    var isCollect = $('#isCollect', '#' + id).val(); // 是否已经收藏

    if (isCollect == "false") {
        $('#isCollect', '#' + id).val(true);
        $('#collectBtnValue', '#' + id).text("已收藏");
        $('#collectSymbol').switchClass("glyphicon-star-empty", "glyphicon-star");
    } else {
        $('#isCollect', '#' + id).val(false);
        $('#collectBtnValue', '#' + id).text("收藏");
        $('#collectSymbol').switchClass("glyphicon-star", "glyphicon-star-empty");
    }
    $.ajax({
        url: "/collectAnswer/" + answerId,
        type: "get",
        data: {"isCollect": isCollect},
        dataType: 'json',
        success: function (response) {
            if (response.state == 1) {
            } else {
            }
        }
    });
});


$('.delConfirmBtn').click(function (event) {

    var answerId = $('.delConfirmBtn').val();

    $('#delConfirmModal').modal('toggle');
    $('#answerId-' + answerId)[0].parentNode.parentNode.hidden = true;

    $.ajax({
        url: "/deleteAnswer/" + answerId,
        type: "get",
        dataType: 'json',
        success: function (response) {
            if (response.state == 1) {
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


$('#submitAnswer').click(function () {

    var answerContent = $('.answerArea').summernote('code');
    var questionId = $('#getQuestionId').val();
    $('.answerArea').summernote('destroy');
    $('#submitBtn').hide();

    $.ajax({
        url: "/submitAnswer/" + questionId,
        type: "post",
        data: {'answerContent': answerContent},
        dataType: 'json',
        success: function (response) {
            if (response.state == 1) {
            } else {
            }
        }
    });
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



