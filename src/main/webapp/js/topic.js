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