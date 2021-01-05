<html >
<head>
    <title>许愿台</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script src="/layui-v2.5.7/layui/layui.js"></script>
    <script src="/jquery-1.7.2.min.js"></script>
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
            <div style="font-size: 20px;text-align: center;padding: 20px 20px;">许愿</div>
            <form class="layui-form"  action="" lay-filter="register">
                <#if wish??>
                    <input type="hidden" name="id" value="${wish.id?c}">
                </#if>
                <input type="hidden" name="userId" value="${userId!}">
                <input type="hidden" id="giftPicture" name="giftPicture" value="${(wish.giftPicture)!}">
                <div class="layui-form-item">
                    <label class="layui-form-label">礼物名称</label>
                    <div class="layui-input-block">
                        <input type="text" name="giftName" value="${(wish.giftName)!}" lay-verify="title" autocomplete="off" placeholder="礼物名称" class="layui-input" >
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">礼物价格</label>
                    <div class="layui-input-block">
                        <input type="text" name="giftPrice" value="${(wish.giftPrice?string('0.##'))!}" lay-verify="price" autocomplete="off" placeholder="礼物价格" class="layui-input" >
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">礼物描述</label>
                    <div class="layui-input-block">
                        <input type="text" name="giftDesc" value="${(wish.giftDesc)!}" autocomplete="off" lay-verify="required"  placeholder="礼物描述" class="layui-input" >
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">礼物链接</label>
                    <div class="layui-input-block">
                        <input type="text" name="giftUrl" value="${(wish.giftUrl)!}" autocomplete="off" lay-verify="required"  placeholder="礼物链接" class="layui-input" >
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">索要原因</label>
                    <div class="layui-input-block">
                        <textarea placeholder="索要原因" class="layui-textarea" lay-verify="required" name="reason" >${(wish.reason)!}</textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">礼物类型</label>
                    <div class="layui-input-block">
                        <input type="radio" name="category" value="1" title="生日" <#if wish?? && wish.category=="1">checked="checked"</#if>>
                        <input type="radio" name="category" value="2" title="节日" <#if wish?? && wish.category=="2">checked="checked"</#if>>
                        <input type="radio" name="category" value="3" title="纪念日" <#if wish?? && wish.category=="3">checked="checked"</#if>>
                        <input type="radio" name="category" value="4" title="重要的人" <#if wish?? && wish.category=="4">checked="checked"</#if>>
                        <input type="radio" name="category" value="5" title="其他" <#if wish?? && wish.category=="5">checked="checked"</#if>>
                    </div>
                </div>
                <div class="layui-upload">
                    <div class="layui-upload-list">
                        <button type="button" class="layui-btn" id="test1">上传图片</button><input class="layui-upload-file" type="file" accept="" name="file">
                        <img class="layui-upload-img" id="demo1" src="${(wish.giftPicture)!}">
                        <p id="demoText"></p>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button type="submit" class="layui-btn" lay-submit="" lay-filter="fsubmit">提交</button>
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
    layui.use(['form', 'layedit', 'laydate','element','upload'], function(){
        var form = layui.form,
            layer = layui.layer,
            layedit = layui.layedit,
            laydate = layui.laydate,
            upload = layui.upload,
            element = layui.element;

        //日期
        laydate.render({
            elem: '#date'
        });

        laydate.render({
            elem: '#date1'
        });
        var uploadInst = upload.render({
            elem: '#test1' //绑定元素
            ,url: '/file/upload' //上传接口
            ,done: function(res){
                $('#demo1').attr('src', res.responseBody);
                $("#giftPicture").val(res.responseBody);
            }
            ,error: function(){
                //请求异常回调
            }
        });
        //自定义验证规则
        form.verify({
            title: function(value){
                if(value.length < 2){
                    return '礼物名称至少得2个字符';
                }
                if(value.length > 50){
                    return '礼物名称不能超过50个字符';
                }
            }
            ,price: function(value){
                if(!/^(([1-9]{1}\d*)|(0{1}))(\.\d{1,2})?$/.test(value)){
                    return '礼物价格错误';
                }
            }
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
                        layer.msg('许愿成功。', {icon: 1});
                        window.setTimeout(function () {
                            window.location.href = "/wish/mine";
                        }, 3000);
                    }
                },
                error: function (o) {
                    layer.msg('许愿失败，请稍候重试。', {icon: 2});
                }
            });
            return false;
        });

    });
</script>
</body>
</html>