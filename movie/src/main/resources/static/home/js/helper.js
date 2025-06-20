if (!Array.indexOf) {
    Array.prototype.indexOf = function (obj) {
        for (var i = 0; i < this.length; i++) {
            if (this[i] == obj) {
                return i;
            }
        }
        return -1;
    }
}
function getCityCode(cityName) {
    var cityCode = "";
    switch (cityName) {
        case "南昌":
            cityCode = '360100';
            break;
        case "景德镇":
            cityCode = '360200';
            break;
        case '萍乡':
            cityCode = '360300';
            break;
        case '九江':
            cityCode = '360400';
            break;
        case '新余':
            cityCode = '360500';
            break;
        case '鹰潭':
            cityCode = '360600';
            break;
        case '赣州':
            cityCode = '360700';
            break;
        case '吉安':
            cityCode = '360800';
            break;
        case '宜春':
            cityCode = '360900';
            break;
        case '抚州':
            cityCode = '361000';
            break;
        case '上饶':
            cityCode = '361100';
            break;
        default:
            cityCode = "360100";
            break;
    }
    return cityCode;
}
function getCityName(cityCode) {
    var cityName = "";
    switch (cityCode) {
        case "360100":
            cityName = '南昌';
            break;
        case "360200":
            cityName = '景德镇';
            break;
        case '360300':
            cityName = '萍乡';
            break;
        case '360400':
            cityName = '九江';
            break;
        case '360500':
            cityName = '新余';
            break;
        case '360600':
            cityName = '鹰潭';
            break;
        case '360700':
            cityName = '赣州';
            break;
        case '360800':
            cityName = '吉安';
            break;
        case '360900':
            cityName = '宜春';
            break;
        case '361000':
            cityName = '抚州';
            break;
        case '361100':
            cityName = '上饶';
            break;
    }
    return cityName;
}
function getQueryString(name, strlocation) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r;
    if (strlocation == undefined || strlocation == null)
        r = window.location.search.substr(1).match(reg);
    else
        r = strlocation.substr(strlocation.indexOf("?") + 1).match(reg);
    if (r != null) return decodeURIComponent(r[2]); return null;
}
function isnull(value) {
    if (value == null)
        return true;
    if (value == undefined)
        return true;
    if (value === "")
        return true;
    if (value === "null")
        return true;
    return false;
}
function findCityCode() {
    var citycode = getCookie("CityCode");
    if (isnull(citycode))
        return null;
    return citycode.toString();
}
function findCityName() {
    var cityname = getCookie("CityName");
    if (isnull(cityname))
        return null;
    return cityname.toString();
}
function SetCookie(name, value, issession) {
    if (issession == true)
        document.cookie = name + "=" + encodeURIComponent(value) + ";path=/";
    else {
        var Days = 365;
        if (!isNaN(issession))
            Days = issession;
        var exp = new Date();
        exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
        document.cookie = name + "=" + encodeURIComponent(value) + ";expires=" + exp.toGMTString() + ";path=/";
        document.cookie = name + "=" + encodeURIComponent(value) + ";expires=" + exp.toGMTString() + ";path=/";
    }
}
function delCookie(name) {
    var exp = new Date();
    exp.setTime(exp.getTime() - 1);
    var cval = getCookie(name);
    if (cval != null) document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
}
function getCookie(name) {
    var arr = document.cookie.match(new RegExp("(^| )" + name + "=([^;]*)(;|$)"));
    if (arr != null)
        return decodeURIComponent(arr[2]);
    return null;
}
function setsessionstorage(respData) {
    SetCookie('NickName', respData.NickName, true);
    SetCookie('Sex', respData.Sex, true);
    SetCookie('Mobile', respData.Mobile, true);
    SetCookie('Account', respData.Account, true);
    SetCookie('LastLoginTime', respData.LastLoginTime, true);
    SetCookie('MobileOrderHint', respData.MobileOrderHint, true);
    SetCookie('MobileOrderSucc', respData.MobileOrderSucc, true);
    SetCookie("ShowDesc", respData.ShowDesc, true);
    SetCookie("UserCenterDesc", respData.UserCenterDesc, true);
    SetCookie("HeaderIcon", respData.HeaderIcon, true);
    SetCookie('paylist', JSON.stringify(respData.PayTypeList), true);
    SetCookie('UnUserdCoupon', respData.UnUserdCoupon, true);
    SetCookie('couponlist', JSON.stringify(respData.CouponList), true);
    SetCookie('Append', respData.Append, true);
    SetCookie('Flag', respData.Flag, true);
    var cids = "";
    for (var i = 0; i < respData.CrashList.length; i++)
    {
        var CouponID=respData.CrashList[i]["CouponID"];
        if (cids == "")
            cids = CouponID;
        else
            cids += "," + CouponID;
        SetCookie(CouponID, JSON.stringify(respData.CrashList[i]));
    }
    SetCookie('crashlist', cids, true);
}
function clearsessionstorage() {
    delCookie('NickName');
    delCookie('Sex');
    delCookie('Mobile');
    delCookie('Account');
    delCookie('LastLoginTime');
    delCookie('MobileOrderHint');
    delCookie('MobileOrderSucc');
    delCookie("ShowDesc");
    delCookie("UserCenterDesc");
    delCookie('paylist');
    delCookie('UnUserdCoupon');
    delCookie('couponlist');
    delCookie('crashlist');
    delCookie("LocalToken");
    delCookie("LocalMobile");
}
function verifyautologin() {
    if (getCookie("Mobile") == null) {
        var Mobile = getCookie("LocalMobile");
        var Token = getCookie("LocalToken");
        if (isnull(Mobile) || isnull(Token))
            return;
        
    }
}
verifyautologin();
function checkUrl(url) {
    var pagename = url.substr(url.indexOf("/") + 1);
    var k = "";
    if (pagename == "" || pagename.indexOf("index") > -1) k = "index";
    if (pagename.indexOf("cinema") > -1) k = "cinema";
    if (pagename.indexOf("movie") > -1) k = "movie";
    if (pagename.indexOf("news") > -1) k = "news";
    $(".nav-list li").removeClass("act").each(function (i) {
        if ($(this).attr("data-index") == k) {
            $(this).addClass("act");
        }
    });
}
function countDown(time, dom, msg, isParent, tag, url) {
    if (time < 0) {
        isParent == 1 ? $(dom).parent().text(msg) : $(dom).text(msg);
        if (url) {
            window.location.href = url;
        }
    }
    else {
        var timer = window.setInterval(function () {
            if (time == 0) {
                window.clearInterval(timer);
                isParent == 1 ? $(dom).parent().text(msg) : $(dom).text(msg);
                if (url) {
                    window.location.href = url;
                }
            }
            else {
                var min = Math.floor(time / 60);
                if (tag == 1) {
                    $(dom).html("<strong>" + min + "</strong>分<em>" + (time % 60) + "</em>秒");
                } else {
                    $(dom).html(min + "：" + (time % 60));
                }

                time--;
            }
        }, 1000);
    }
}
function getMsgStatus(StatusFlag, showtime, now) {
    var msg = "";
    var showtime = new Date(Date.parse(showtime.replace(/-/g, "/"))).getTime();
    var now = new Date(Date.parse(now.replace(/-/g, "/"))).getTime();
    switch (StatusFlag) {
        case "1":
            msg = "待付款";
            break;
        case "3":
            msg = "待付款";
            break;
        case "9":
            if (now < showtime) {
                msg = "未使用";
            } else {
                msg = "已完成";
            }
            break;
        case "10":
            if (now < showtime) {
                msg = "未使用";
            } else {
                msg = "已完成";
            }
            break;
        case "21":
            msg = "待付款";
            break;
        case "31":
            msg = "已退款";
            break;
        case "32":
            msg = "已退款";
            break;
        default:
            msg = "暂无信息";
    }
    return msg;
}
$(function () {
    checkUrl(window.location.pathname);

    var tm = $(".menu-usercenter .numorder em");
    if ($.trim(tm.text()) != "0") {
        tm.parent().show();
    }
});
function showMask(msg) {
    if ($(".loadpanel").length == 0) {
        var msg = msg || "努力加载中,么么哒～";
        var strHtml = '<div style="position:relative;left:50%"><div style="text-align: center"><img class="spinnerimg" width="80px" height="80px" src="/resource/images/loading.gif")" /></div><div class="spinnermsg">' + msg + '</div></div>';
        var container = document.createElement("div");
        container.innerHTML = strHtml;
        container.className = "loadpanel";
        document.body.appendChild(container);
    }
}
function closeLoadMask() {
    $(".loadpanel").remove();
}

function jsonDate(v, format) {
    if (!v) return "";
    var reg = /^\/Date\(([-\d]*)\)\/$/;
    var result = v.match(reg);
    if (!result) return "";
    var dt = new Date(parseInt(result[1]));
    var year = dt.getYear();
    year = year > 1000 ? year : (1900 + year);
    var month = dt.getMonth() + 1;
    if (!format)
        return year + "年" + month + "月";
    else
        return format.replace("yyyy", year).replace("MM", month).replace("dd", dt.getDate()).replace("HH", (dt.getHours() < 10) ? "0" + dt.getHours() : dt.getHours()).replace("mm", (dt.getMinutes() < 10) ? "0" + dt.getMinutes() : dt.getMinutes()).replace("ss", (dt.getSeconds() < 10) ? "0" + dt.getSeconds() : dt.getSeconds());
}