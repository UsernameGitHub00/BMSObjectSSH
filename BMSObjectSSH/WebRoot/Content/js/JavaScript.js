function LoadData(selectId, jsonData) {
    $("#" + selectId).empty();//清空该元素
    for (k in jsonData) {
        $("#" + selectId).append('<option value="' + jsonData[k].text + '">' + jsonData[k].text + '</option>');
    }
}


function Select(selectId, url) {
    $.post(url, function (data) {
        LoadData(selectId, data);
    });
}