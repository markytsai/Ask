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
    if (checkVal.length == 0) {
        checkVal.push(-1);
    }
    $.ajax({
        url: "/doChooseTopic",
        type: "post",
        data: {"topicIds": checkVal},
        success: function (response) {
            if (response.code == 1) {
                window.location.href = "/recommend";
            } else {
                alert("操作失败");
            }
        }
    });
});

$("#updatePrefBtn").on("click", function () {

    var checkVal = [];
    $("input.styled[name='selectedIds']:checkbox").each(function () {
        if ($(this).is(":checked")) {
            var s = $(this).val();
            checkVal.push(s);
        }
    });
    if (checkVal.length == 0) {
        checkVal.push(-1);
    }
    $.ajax({
        url: "/doUpdateTopic",
        type: "post",
        data: {"topicIds": checkVal},
        success: function (response) {
            if (response.code == 1) {
                window.location.reload();
            } else {
                alert("更新失败");
            }
        }
    });
});


$('.topicName').on('click', function (event) {
    var topicId = event.target.parentNode.firstElementChild.id;

    if ($('#' + topicId + '-hide').is(":hidden")) {
        $("#" + topicId + "-hide").fadeIn(2000)
        // document.getElementById(topicId + '-hide').style.display = "";
    } else {
        $("#" + topicId + "-hide").fadeOut("slow");
        // document.getElementById(topicId + '-hide').style.display = "none";
    }

});

$("input[type='checkbox']").change(function () {
    var div = $(this).closest('div');
    var checked = div.find('input[type="checkbox"]:checked').length > 0;

    $(this).closest('.parent').find('input[type="checkbox"]').first().prop('checked', checked);
});

// 调用查询三级话题标签函数
getSecondSubTopic();

// 加载出每一个二级话题标签的子标签列表，并且隐藏起来
function getSecondSubTopic() {

    getSocialScienceTopics(19551971);
    getSocialScienceTopics(19553298);
    getSocialScienceTopics(19580282);
    getSocialScienceTopics(19649905);
    getSocialScienceTopics(19744646);
    getSocialScienceTopics(19778273);


    // getNaturalScienceTopics(19553298);
    // getScienceTopics(19580282);
    // getLiberalArtTopics(19649905);
    // getFormalScienceTopics(19744646);
    // getTechnologyAndAppliedScienceTopics(19778273);

}

function getSocialScienceTopics(rootTopicId) {

    $.ajax({
        url: "/getSocialScienceTopics/" + rootTopicId,
        type: "get",
        success: function (response) {
            // 成功获取子话题列表
            if (response.code == 1) {
                var map = response.dataBody;

                for (var key in map) {
                    if (key.split('-')[1] === "1") {
                        document.getElementById(key.split('-')[0]).checked = true;
                    }
                }

                for (var key in map) {

                    var rootDiv = $('#' + rootTopicId);
                    rootDiv.append("<div id=\"" + key.split('-')[0] + "-hide" + "\" style=\"margin-left: 30px;background-color: " +
                        "#efe3e3;margin-top: -15px;padding-bottom: 0px;display: none;\"><h3 style=\"font-size: 16px;\">" +
                        "子话题" + "</h3></div>");

                    var topicList = map[key];
                    for (i = 0, len = topicList.length; i < len; i++) {
                        var topic = topicList[i];
                        var secondTopicId = topic.topicId;
                        var topicName = topic.topicName;

                        var checkStatus = topic.topicFollowd == 1 ? "checked = \"true\" " : "";

                        $('#' + key.split('-')[0] + "-hide").append(
                            "<div class=\"checkbox checkbox-inline checkbox-danger\" style=\"margin-bottom: 16px;margin-left: 0px;\">\n" +
                            "<input type=\"checkbox\" class=\"styled\" value=\"" + secondTopicId + "\" " + "id=\"" + secondTopicId + "\" " + checkStatus + "name=\"selectedIds\"/>\n" +
                            "<label class=\"name-hide\" style=\"padding-left: 3px;padding-right: 10px;\">" + topicName + "</label></div>"
                        );

                    }
                }
            }
        }
    })
}

