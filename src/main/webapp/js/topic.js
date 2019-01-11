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


$('.shareTopicIcon').mouseover(function () {
    // $('.share-list').switchClass("hideShareItem", "showShareItem");
    $('.share-list').show();
});

$('.shareTopicIcon').mouseleave(function () {
    // $('.share-list').switchClass("showShareItem", "hideShareItem");
    $('.share-list').hide();
})

$('.share-list').mouseleave(function () {
    // $('.share-list').switchClass("showShareItem", "hideShareItem");
    $('.share-list').hide();
})

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
            if (response.state == 1) {
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
            if (response.state == 1) {
                $('.focusTopic').text('关注话题');
            } else {
                alert("操作失败");
            }
        }
    });
}
