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
            <div style="font-size: 20px;text-align: center;padding: 20px 20px;">许愿</div>
            <form class="layui-form"  action="" lay-filter="register">
                <input type="hidden" name="userId" value="${userId!}">
                <div class="layui-form-item">
                    <label class="layui-form-label">礼物名称</label>
                    <div class="layui-input-block">
                        <input type="text" name="giftName" lay-verify="required" autocomplete="off" placeholder="礼物名称" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">礼物价格</label>
                    <div class="layui-input-block">
                        <input type="text" name="giftPrice" lay-verify="required" autocomplete="off" placeholder="礼物价格" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">礼物描述</label>
                    <div class="layui-input-block">
                        <input type="text" name="giftDesc"  autocomplete="off" lay-verify="required"  placeholder="礼物描述" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">礼物链接</label>
                    <div class="layui-input-block">
                        <input type="text" name="giftUrl"  autocomplete="off" lay-verify="required"  placeholder="礼物链接" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">索要原因</label>
                    <div class="layui-input-block">
                        <textarea placeholder="索要原因" class="layui-textarea" lay-verify="required" name="reason"></textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">礼物类型</label>
                    <div class="layui-input-block">
                        <input type="radio" name="category" value="1" title="生日" checked="">
                        <input type="radio" name="category" value="2" title="节日">
                        <input type="radio" name="category" value="3" title="纪念日">
                        <input type="radio" name="category" value="4" title="重要的人">
                        <input type="radio" name="category" value="5" title="其他">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button type="submit" class="layui-btn" lay-submit="" lay-filter="fsubmit">注册</button>
                    </div>
                </div>
            </form>


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
<script>
    layui.use(['form', 'layedit', 'laydate','element'], function(){
        var form = layui.form,
            layer = layui.layer,
            layedit = layui.layedit,
            laydate = layui.laydate,
            element = layui.element;

        //日期
        laydate.render({
            elem: '#date'
        });

        laydate.render({
            elem: '#date1'
        });

        //监听提交
        form.on('submit(fsubmit)', function(data){
            $.ajax({
                url : '/wish/create',
                type: "post",
                data : data.field,
                dataType : "json",
                success : function (o) {
                    if (o.status == 'success') {
                        layer.msg('索要成功。', {icon: 1});
                        window.setTimeout(function () {
                            window.location.href = "/wish/mine";
                        }, 3000);
                    }
                },
                error: function (o) {
                    layer.msg('索要失败，请稍候重试。', {icon: 2});
                }
            });
            return false;
        });

    });
</script>
</body>
</html>