$('.exchange-en-zh-edition').click(function () {

    if ($('.zh-edition').css('display') == "block") {
        $('.zh-edition').hide();
        $('.en-edition').show();
        $('.exchange-en-zh-edition').text('切换中文介绍');
    } else {
        $('.en-edition').hide();
        $('.zh-edition').show();
        $('.exchange-en-zh-edition').text('切换英文介绍');
    }
});


$('.shareTopicIcon').on("click", function () {
    // var listStatus = $('.share-list').style.display;
    if ($('.share-list').hasClass("hideShareItem")) {
        $('.share-list').switchClass("hideShareItem", "showShareItem");
    } else {
        $('.share-list').switchClass("showShareItem", "hideShareItem");
    }

    // if (listStatus == "block") {
    //     $('.share-list').hide();
    // } else {
    //     $('.share-list').show();
    // }
});

document.addEventListener("click", function (e) {
    if ($('.share-list').hasClass("showShareItem")) {
        $('.share-list').switchClass("showShareItem", "hideShareItem");
    }
});

// $('.shareTopicIcon').mouseleave(function () {
//     // $('.share-list').switchClass("showShareItem", "hideShareItem");
// })

// $('.share-list').mouseleave(function () {
//     // $('.share-list').switchClass("showShareItem", "hideShareItem");
//     $('.share-list').hide();
// })

$('.focusTopic').on("click", function () {
    var topicId = this.id.split('-')[1];
    var currStat = this.textContent;
    if (currStat == '关注话题') {
        followTopic(topicId);
    } else {
        unfollowTopic(topicId);
    }
});

function followTopic(topicId) {
    $.ajax({
        url: "/followTopic/" + topicId,
        type: "get",
        dataType: 'json',
        success: function (response) {
            if (response.code == 1) {
                $('.focusTopic').text('取消关注');
            } else {
                alert("操作失败");
            }
        }
    });
}


function unfollowTopic(topicId) {
    $.ajax({
        url: "/unfollowTopic/" + topicId,
        type: "get",
        dataType: 'json',
        success: function (response) {
            if (response.code == 1) {
                $('.focusTopic').text('关注话题');
            } else {
                alert("操作失败");
            }
        }
    });
}


$("#startBtn").on("click", function () {

    var checkVal = [];
    $("input.styled[name='selectedIds']:checkbox").each(function () {
        if ($(this).is(":checked")) {
            var s = $(this).val();
            checkVal.push(s);
        }
    });
    $.ajax({
        url: "/doChooseTopic",
        type: "post",
        data: {"topicIds" : checkVal},
        success: function (response) {
            if (response.code == 1) {
                window.location.href = "/recommend";
            } else {
                alert("操作失败");
            }
        }
    });
    alert(checkVal);
});

