<!DOCTYPE html>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=990, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta charset="utf-8" />
    <meta name="renderer" content="webkit">
    <title>帮助中心|猫眼电影票网_电影在线选座购票平台</title>
    <meta name="keywords" content="猫眼电影票,猫眼电影票网,猫眼电影院,猫眼影票,猫眼电影,电影票，电影"/>
    <meta name="description" content="猫眼电影票网是猫眼最大的电影票在线选座平台，同时猫眼电影票网还提供电影排期，影院信息查询、猫眼本土电影行业资讯等服务。看电影，来猫眼电影票选座"/>
    <#include "../common/head-css.ftl"/>
</head>
<body>
	<#include "../common/header.ftl"/>   
<div id="body" class="main">
<div class="wrapper-helpcenter fn-clear">
    <div class="menu-helpcenter">
    <#include "../common/help-menu.ftl"/>
</div>
    <div class="box-con service-helpcenter">
        <h1>法律声明</h1>
        <div class="con">
            <p>
                本网站全部内容由猫眼省影票文化传媒有限公司所拥有和管理，并受中国法律的保护。本网站根据以下法律声明为您提供服务。该法律声明可由本网站随时更新,且不需另行通知。本网站法律声明(以下简称本“法律声明”)一旦发生变动，本网站将在网页上公布修改内容。修改后的法律声明一旦在网页上公布即有效代替原来的法律声明。
            </p>
            <h3>一、用户隐私制度</h3>
            <p>
                1、在您访问本网站时，本网站不会将您的个人识别信息透露给任何人。然而，有些时候我们可能需要您的一些信息，例如您的姓名和电子邮件地址等。
            </p>
            <p>
                2、我们不会向任何第三方泄露、出售或者出租您向本站披露的任何信息，除非得到您的允许或基于法律的要求。
            </p>
            <h3>二、免责条款</h3>
            <p>
                1、本网站对所提供的所有信息资料，在上传之前已尽谨慎义务。本网站无法承诺所有信息资料的绝对准确性和完整性，所以用户应做到审慎原则，对用户因依赖该信息资料而可能所致的任何损失，本网站均不负责。
            </p>
            <p>
                2、本网站所有人将尽力在本网站提供更新和准确的信息，但对本网站所提供信息的准确性、及时性和完整性不作任何陈述、承诺或保证。除特别注明之条款外，本网站所有人对使用者由于访问（如：感染计算机病毒、涉及版权或其它知识产权纠纷及其它不良信息造成的损失），或不能访问本网站或者由于依赖本网站所提供信息而产生的任何损失或损害，本网站不承担任何责任。
            </p>
            <p>
                3、是否使用服务下载或取得任何资料应由您自行考虑且自负风险，因任何资料之下载而导致的您电脑系统之任何损坏或数据流失等后果，由您自行承担。
            </p>
            <p>
                4、用户自本网站取得的任何建议或信息，无论是书面或口头形式，除非法律声明有明确规定，将不构成本法律声明以外之任何保证。
            </p>
            <h3>三、版权保护</h3>
            <p>
                 1、猫眼省影票文化传媒有限公司享有所有本网站原创文章、报道、标识的著作权，使用者只可以为非商业性的个人目的下载本网站内容，但不得对该内容进行修改或翻制。
            </p>
            <p>
                2、非经本网站的书面同意，任何人不得以商业目的传播或使用。本网站内容不得以其他任何方式进行复制或使用。
            </p>
            <p>
                3、本网站发布、转载其他媒体或网站的文章，仅出于传递信息供广大用户参考和研究使用，但不意味着赞同其观点或证实其内容的真实性。
            </p>
            <p>
                4、本网站所使用的大部分图片均涉及版权所有，未经授权请勿转载或使用。如有任何相关版权问题，请与我司联系。
            </p>
            <h3>四、适用法律</h3>
            <p>
                1、本法律声明及用户与本网站之关系，均适用中华人民共和国法律。用户与本网站就本法律声明或其它有关事项发生的争议，应提有我司所在地的法院通过诉讼方式解决。
            </p>
            <p>
                2、如若本法律声明之任何规定因与中华人民共和国法律相抵触而导致无效，您同意将按照相关法律法规之规定，努力实现本条款当事人之间的、在本法律声明项下的目的，且本法律声明之其他条款仍应具有完整的法律效力。
            </p>
            <h3>五、其他</h3>
            <p>
                以上声明之解释权归本网站所有，法律上有相关解释的，以中国法律之解释为基准。
            </p>

        </div>
    </div>
</div>
</div>
<#include "../common/footer-js.ftl"/> 
<#include "../common/footer.ftl"/> 
<#include "../common/login-dialog.ftl"/>
<script type="text/javascript">
    $(function () {
        $(".menu-helpcenter li a").each(function () {
            if ($(this).attr("data-i") == "legalstatement") {
                $(this).parent().addClass("act");
            }
        });
    });
</script>
<script type="text/javascript">
    $(function () {
        var url = window.location.href;
        var strs = url.split("#");
        $(".wrapper-helpcenter .help-aq li a:[name=" + strs[1] + "]").parent().parent().siblings().removeClass("act pb10").end().addClass("act pb10");
        $(".info-help .help-nav li a").click(function () {
            var name = $(this).attr("href").split("#")[1];
            $(".wrapper-helpcenter .help-aq li a:[name=" + name + "]").parent().parent().siblings().removeClass("act pb10").end().addClass("act pb10");
        });
        $(".wrapper-helpcenter .help-aq li").click(function () {
            if (!$(this).hasClass("act")) {
                $(this).siblings().removeClass("act pb10").end().addClass("act pb10");
            }
        });
    });
</script>
</body>
</html>