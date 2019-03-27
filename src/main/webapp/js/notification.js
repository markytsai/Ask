$("#loadSysMore").on("click", function () {
    var curPeriodDaysNo = document.getElementById("loadSysMore").dataset.value;
    var nextPeriodDayNo = parseInt(curPeriodDaysNo) + 1;
    document.getElementById("loadSysMore").dataset.value = nextPeriodDayNo;
    $("#loadSysMore").val("加载中...");

    $.ajax({
        url: "/loadMore/sys?periodNo=" + nextPeriodDayNo,
        type: "get",
        dataType: 'json',
        success: function (response) {
            if (response.code == 1) {

                $("#loadSysMore").val("加载更多");

                var dayList = response.dataBody;


                for (var i = 0; i < dayList.length; i++) {
                    var rootDiv = document.createElement('div');
                    rootDiv.setAttribute("class", "card-block border-dark day");
                    var day = dayList[i];
                    if (day.messageList.length == 0) {
                        continue;
                    }

                    var formatDate = moment(day.date).format('YYYY-MM-DD');
                    var dateDiv = document.createElement('div');
                    dateDiv.innerHTML = "<span>" + formatDate + "</span>\n";
                    rootDiv.appendChild(dateDiv);

                    var messages = day.messageList;
                    for (var j = 0; j < messages.length; j++) {
                        var singleMessageDiv = document.createElement('div');
                        singleMessageDiv.setAttribute("class", "card-title text-dark");
                        singleMessageDiv.innerHTML = "<span>" + messages[j].messageContent + "</span>\n";
                        rootDiv.appendChild(singleMessageDiv);
                    }
                    document.getElementById("noti-sys").appendChild(rootDiv);
                }
            } else {
                alert("操作失败");
            }
        }
    });

});