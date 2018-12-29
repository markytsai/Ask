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

/*提问表单处理*/
/* 提问处理 */
$("#askBtn").on("click", function () {
    var formData = {
        "questionTitle": $("#questionTitle").val(),
        "questionContent": $("#questionContent").val()
    };

    $.ajax({
        url: "/addQuestion/",
        type: "post",
        data: formData,
        dataType: 'json',
        success: function (response) {
            debugger
            if (response.state == 1) {
                window.location.href = "/question/" + response.data;
            } else {
                alert("出现了错误...");
            }
        }
    });
});