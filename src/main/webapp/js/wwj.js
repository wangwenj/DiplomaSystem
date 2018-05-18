// item:哪一个输入框要判断（name，id）；
// modalType：模态框的类型（add或者update）；
//length:要求的字符长度
//url:servlet中判断是否重复的方法
//modalId:模态框的id



function judgeLength(inputValue, length, inputId, msg_judgeLength, modalId,msg_success) {
    debugger
    if (inputValue.length == 0 || inputValue.length > length) {
        setWrongNotice(inputId, inputValue, msg_judgeLength, modalId);
        return "noLength"
    }
    else setSuccessNotice(inputId,msg_success);
}


function judgeIsNum( inputId,inputVal,modalId) {
    var r = /^\+?[1-9][0-9]*$/;　　//判断是否为正整数
    if(r.test(inputVal)==false){
        setWrongNotice(inputId, inputVal, '必须输入数字', modalId);
        return "notNumber";
    }
}

/*
* 先判断数字---->再判断长度--->最后是否重复-->输出可用
* */
function checkRepeat(item, modalType, length, url, modalId, msg_judgeLength, msg_repeat, mag_success) {
    // alert("进入了重复判断");
    var inputId = "#" + item + "_" + modalType + "_input";
    debugger
    var inputVal = $(inputId).val();
    if (item == "id") {
        if(judgeIsNum(inputId,inputVal,modalId)=="notNumber")
        return false;
    }
    if (judgeLength(inputVal, length, inputId, msg_judgeLength, modalId) == "noLength")
        return false;
    $.ajax({
        url: url,
        data: {"parameter": inputVal},
        dataType: "text",
        type: "post",
        success: function (result) {
            var x = parseInt(result);
            if (x == 100) {
                setSuccessNotice(inputId, mag_success)
            }
            else {
                setWrongNotice(inputId, inputVal, msg_repeat, modalId);
            }
        },
        error: function (xhr, status, errMsg) {
            alert("数据传输失败!");
        }

    });
}

//设置提示文字的颜色和输入框中的提示文字内容
function setWrongNotice(inputId, placeholder, msg, modalId) {
    $(inputId).next(".notice").css({color: "red"});
    $(inputId).next(".notice").text("*" + msg);
    $(inputId).attr("placeholder", placeholder);
    $("#" + modalId).addClass("bounce");
    $(inputId).val(null);
}

function setSuccessNotice(inputId, msg) {
    $(inputId).next(".notice").css({color: "green"});
    $(inputId).next(".notice").text("*" + msg);

}

function judgeLengthAndIsNum(inputValue, length, inputId, msg_judgeLength, modalId,msg_success) {
    debugger
    var isNum=judgeIsNum( inputId,inputValue,modalId);
    if(isNum=="notNumber") return false;
    var length=judgeLength(inputValue, length, inputId, msg_judgeLength, modalId,msg_success);
    if(length=="noLength") return false;
    else setSuccessNotice(inputId,msg_success);
}

