<html >
<head>
    <title>许愿台</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script src="/layui-v2.5.7/layui/layui.js"></script>
    <script src="/jquery.min.js"></script>
    <link rel="stylesheet" href="/layui-v2.5.7/layui/css/layui.css" media="all">
    <style>
        .layui-upload-img {
            width: 92px;
            height: 92px;
            margin: 0 10px 10px 0;
        }
    </style>
</head>


<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <#include "header.ftl">

    <div class="layui-body" style="left: 200px;right: 200px;">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <div style="font-size: 20px;text-align: center;padding: 20px 20px;">许愿详情</div>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-size: 14px;">
                    <tr style="height: 40px;">
                        <td style="padding: 5px 5px;text-align: right; border: 1px solid #e6e6e6;background-color: #f2f2f2;">礼物名称：</td>
                        <td style="border-top: 1px solid #CCCCCC; border-right: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC;padding: 5px 5px;"><a href="${wish.giftUrl}" target="_blank">${wish.giftName!}</a></td>
                        <td style="background-color: #f2f2f2;padding: 5px 5px;text-align: right;border-top: 1px solid #e6e6e6; border-right: 1px solid #e6e6e6; border-bottom: 1px solid #e6e6e6;">礼物价格：</td>
                        <td style="border-top: 1px solid #CCCCCC; border-right: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC;padding: 5px 5px;">￥${wish.giftPrice?string('0.##')}</td>
                        <td style="background-color: #f2f2f2;padding: 5px 5px;text-align: right;border-top: 1px solid #e6e6e6; border-right: 1px solid #e6e6e6; border-bottom: 1px solid #e6e6e6;">礼物类型：</td>
                        <td style="border-top: 1px solid #CCCCCC; border-right: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC;padding: 5px 5px;">
                            ${categoryMap[wish.category]}
                        </td>
                    </tr>
                    <tr style="height: 40px;">
                        <td style="background-color: #f2f2f2;padding: 5px 5px;text-align: right;border-left: 1px solid #e6e6e6; border-right: 1px solid #e6e6e6; border-bottom: 1px solid #e6e6e6;">礼物描述：</td>
                        <td colspan="5" style="border-right: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC;padding: 5px 5px;">${wish.giftDesc!}</td>
                    </tr>
                    <tr style="height: 40px;">
                        <td style="background-color: #f2f2f2;padding: 5px 5px;text-align: right;border-left: 1px solid #e6e6e6; border-right: 1px solid #e6e6e6; border-bottom: 1px solid #e6e6e6;">索要原因：</td>
                        <td colspan="5" style="border-right: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC;padding: 5px 5px;">${wish.reason!}</td>
                    </tr>
                    <tr>
                        <td style="background-color: #f2f2f2;padding: 5px 5px;text-align: right;vertical-align: top;border-left: 1px solid #e6e6e6; border-right: 1px solid #e6e6e6; border-bottom: 1px solid #e6e6e6;">礼物图片：</td>
                        <td colspan="5" style="border-right: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC;padding: 5px 5px;"><img id="demo1" src="${wish.giftPicture!}"></td>
                    </tr>
                </table>
            <#if records??>
            <div class="layui-form">
                <table border="0" cellpadding="0" cellspacing="0" width="100%" style="margin: 20px 0px;">
                    <tr style="height: 40px;"><td align="center" style="font-weight: bold;">捐赠记录</td></tr>
                </table>
                <div>已捐赠：￥${sum}，剩余：￥${left}</div>
                <div class="layui-progress layui-progress-big" lay-showpercent="true">
                    <div class="layui-progress-bar" lay-percent="${progress}%"></div>
                </div>
                <table class="layui-table">
                    <colgroup>
                        <col width="150">
                        <col width="150">
                        <col width="200">
                        <col width="150">
                        <col>
                    </colgroup>
                    <thead>
                    <tr>
                        <th>捐赠人</th>
                        <th>关系</th>
                        <th>捐赠时间</th>
                        <th>捐赠金额</th>
                        <th>留言</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list records as item>
                    <tr>
                        <td><#if item.name == ''>&lt;匿名&gt;<#else>${item.name}</#if></td>
                        <td>${relationMap[item.relationship]}</td>
                        <td>${item.createTime}</td>
                        <td>${item.amount}</td>
                        <td>${item.message}</td>
                    </tr>
                    </#list>
                    </tbody>
                </table>
            </div>
            </#if>
            <#if showDonateBut?? && showDonateBut == true>
                <button type="button" class="layui-btn" id="btn1">捐赠</button>
            </#if>


        </div>
    </div>

    <#include "foot.ftl">

</div>


<script>

    layui.use(['form', 'layedit', 'laydate','element','upload', 'layer', 'element'], function(){
        var form = layui.form,
            layer = layui.layer,
            element = layui.element;
        $=layui.jquery;

        $(document).on('click','#btn1',function(){
            layer.open({
                title : '捐赠',
                type: 2,
                area: ['600px', '560px'],
                content: '/donate/go?wishId=${wish.id?c}'
            });
        });

    });

</script>
</body>
</html>