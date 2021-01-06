<html >
<head>
    <title>我的愿望-许愿台</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script src="/layui-v2.5.7/layui/layui.js"></script>
    <script src="/jquery-1.7.2.min.js"></script>
    <link rel="stylesheet" href="/layui-v2.5.7/layui/css/layui.css" media="all">
    <style>
        .layui-upload-img {
            width: 48px;
            height: 48px;
        }
    </style>
</head>


<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <#include "header.ftl">


    <div class="layui-body" style="left: 200px;right: 200px;">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <div>
                <button type="button" class="layui-btn" id="btn">新建愿望</button>
            </div>
        </div>
        <table class="layui-table" lay-even="" lay-skin="row">
            <colgroup>
                <col width="150">
                <col width="150">
                <col width="200">
                <col width="150">
                <col>
                <col width="150">
            </colgroup>
            <thead>
            <tr>
                <th>礼物名称</th>
                <th>礼物价格</th>
                <th>礼物描述</th>
                <th>礼物类型</th>
                <th>礼物图片</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <#list wishes as item>
                <tr>
                    <td>${item.giftName}</td>
                    <td>${item.giftPrice}</td>
                    <td>${item.giftDesc}</td>
                    <td>${categoryMap[item.category]!}</td>
                    <td><img class="layui-upload-img" src="${item.giftPicture!}"></td>
                    <td>
                        <a href="/wish/make?id=${item.id?c}" target="_blank">编辑</a>
                        <a href="/wish/detail?id=${item.id?c}" target="_blank">捐赠</a>
                    </td>
                </tr>
            </#list>

            </tbody>
        </table>
    </div>

<#include "foot.ftl">
</div>

<script>
    //JavaScript代码区域
    layui.use(['element','jquery'], function(){
        var element = layui.element;
        $=layui.jquery;
        $(document).on('click','#btn',function(){
            window.location.href = "/wish/make";
        });
    });
</script>
</body>
</html>