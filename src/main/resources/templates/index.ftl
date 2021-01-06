<html >
<head>
    <title>许愿台</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script src="/layui-v2.5.7/layui/layui.js"></script>
    <script src="/jquery-1.7.2.min.js"></script>
    <link rel="stylesheet" href="/layui-v2.5.7/layui/css/layui.css" media="all">
</head>


<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <#include "header.ftl">


    <div class="layui-body" style="left: 200px;right: 200px;">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">


                <#if wishes??>
                    <#list wishes as item>
                    <div style="width: 250px;height: 350px; border: 1px solid #1E9FFF;float: left;margin: 10px 10px;">
                        <div>
                            <img src="${item.giftPicture!}" style="width: 250px;height: 300px;">
                        </div>
                        <div style="text-align: center;margin: 5px 5px;">
                            <span>${item.giftName}</span>&nbsp;<span>￥${item.giftPrice}</span>
                            <br/>
                            <span><a href="/wish/detail?id=${item.id?c}" target="_blank">查看详情</a></span>
                        </div>
                    </div>
                    </#list>
                </#if>



        </div>
    </div>

<#include "foot.ftl">
</div>

<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
</body>
</html>