<script src="/home/js/jquery.1.7.2.min.js" type="text/javascript"></script>
<script src="/home/js/json2.min.js" type="text/javascript"></script>
<script src="/home/js/helper.js" type="text/javascript"></script>
<script src="/home/js/jquery.tool.expose.min.js" type="text/javascript"></script>
<script src="/home/js/jquery.tool.overlay.min.js" type="text/javascript"></script>
<script src="/home/js/jquery.tool.tabs.min.js" type="text/javascript"></script>
<script src="/home/js/jquery.flexslider.min.js" type="text/javascript"></script>
<script src="/home/js/jquery.jRating.min.js" type="text/javascript"></script>
<script src="/home/js/common.js" type="text/javascript"></script>
<script type="text/javascript">
$(function () {
    $(".bottom-nav li:first").css("margin-left","0");
    $(".bottom-nav li:last").addClass("fn-nobg");
    $(".main-nav .location").toggle(function () {
        $(this).addClass("lsec").find(".other-city").show();
    }, function () {
        $(this).removeClass("lsec").find(".other-city").hide();
    });
    $(window).scroll(function () {
        if ($(window).scrollTop() > 100) {
            $(".nav-scroll").fadeIn(1500);
        } else {
            $(".nav-scroll").fadeOut(1500);
        }
    });
    $(".scroll-top").click(function () {
        $("html, body").animate({
            scrollTop: "0px"
        }, {
            duration: 500,
            easing: "swing"
        });
        return false;
    });
    $(".nav-scroll .code").hover(function () {
        $(this).find("span").show();
    }, function () {
        $(this).find("span").hide();
    });
});

function changecity(cityCode) {
   ajaxRequest('/home/index/change_area','post',{cid:cityCode},function(rst){
   		window.location.reload();
   })
}
</script>