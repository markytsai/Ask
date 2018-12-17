$(function () {
    var openMask = $(".open-mask");
    var closeMask = $(".close-mask");
    var mask = $(".mask");
    var askModal = $("#ask-modal");

    $("#contentByHtmlElement").smartbox({
        type: 'inline',// 'inline':title、content、footer 内容来自html标签；'option':title、content、footer 内容来自配置 |type string
        width: 500,
        height: 300,
        isAutoShow: false
    });

    $("#askWindow").click(function () {
        $("#contentByHtmlElement").smartbox("open");
    });
});

