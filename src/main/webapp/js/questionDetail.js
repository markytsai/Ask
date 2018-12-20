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
    $('#editFrame').show();
});

$('#submitAnswer').click(function () {
    $('#editFrame').hide();
});
$('#quitAnswer').click(function () {
    $('#editFrame').hide();
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
    } else {
        $('#isCollect', '#' + id).val(false);
        $('#collectBtnValue', '#' + id).text("收藏");
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


$('.delBtn').click(function (event) {

    var id = event.target.parentNode.id;
    var answerId = id.split('-')[1];

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

    var answerContent = $('#answerContent').val();
    var questionId = $('#getQuestionId').val();

    $.ajax({
        url: "/submitAnswer/" + questionId,
        type: "get",
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

// $('.avatarImg').bind("mouseenter", function (event) {
//     document.getElementById('personInfoCard').style.display = "block";
//
// });
//
// $('.avatarImg').bind("mouseover", function (event) {
//     document.getElementById('personInfoCard').style.display = "none";
// });



