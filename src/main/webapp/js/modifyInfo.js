$('.modifyButton').on('click', function (event) {
    a = 1;
    // 判断点击是哪个修改按钮
    var modifyType = event.target.parentNode.id;

    // 显示修改窗口
    $('#' + modifyType).hide();
    $('#save' + modifyType.substr(4, modifyType.length)).show();

});

$('.cancelSave').on('click', function (event) {
    // 判断点击是哪个修改按钮
    var modifyType = event.target.parentNode.id;

    // 显示原来的窗口
    $('#show' + modifyType.substr(4, modifyType.length)).show();
    $('#' + modifyType).hide();
});


$('.saveBtn').on('click', function (event) {

    var saveType = event.target.parentNode.id;

    var saveData = saveType.substr(4, saveType.length);

    doUpdateProfile(saveData, document.getElementById(saveData.substr(0, 1).toLowerCase() + saveData.substr(1, saveData.length) + 'Input').value);

    // switch (saveType) {
    //     case 'saveUsername': {
    //         doModifyUsername(document.getElementById('usernameInput').value);
    //     }
    // }

});

function doUpdateProfile(saveData, savedContent) {
    var getUrl = '/update' + saveData + '/' + savedContent;
    $.ajax({
        url: getUrl,
        type: "get",
        success: function (response) {
            if (response.code = 105) {
                $('#save' + saveData).hide();
                $('.' + saveData.toLowerCase()).text(savedContent);
                $('#show' + saveData).show();
            }
        }
    });

}