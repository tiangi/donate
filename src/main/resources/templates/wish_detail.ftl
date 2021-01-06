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
            <div style="font-size: 20px;text-align: center;padding: 20px 20px;">许愿详情</div>
            <form class="layui-form"  action="" lay-filter="register">
                <input type="hidden" name="wishId" value="${wish.id!}">
                <div class="layui-form-item">
                    <label class="layui-form-label">礼物名称</label>
                    <div class="layui-input-block">
                        <input type="text" name="giftName" value="${wish.giftName!}" autocomplete="off" placeholder="礼物名称" class="layui-input" readonly="readonly">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">礼物价格</label>
                    <div class="layui-input-block">
                        <input type="text" name="giftPrice" value="${wish.giftPrice?string('0.##')}" autocomplete="off" placeholder="礼物价格" class="layui-input" readonly="readonly">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">礼物描述</label>
                    <div class="layui-input-block">
                        <input type="text" name="giftDesc" value="${wish.giftDesc!}" autocomplete="off" placeholder="礼物描述" class="layui-input" readonly="readonly">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">礼物链接</label>
                    <div class="layui-input-block">
                        <input type="text" name="giftUrl" value="${wish.giftUrl}" autocomplete="off"  placeholder="礼物链接" class="layui-input" readonly="readonly">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">索要原因</label>
                    <div class="layui-input-block">
                        <textarea placeholder="索要原因" class="layui-textarea" name="reason" disabled="disabled">${wish.reason!}</textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">礼物类型</label>
                    <div class="layui-input-block">
                        <input type="radio" name="category" value="1" title="生日" <#if wish.category=="1">checked="checked"</#if>>
                        <input type="radio" name="category" value="2" title="节日" <#if wish.category=="2">checked="checked"</#if>>
                        <input type="radio" name="category" value="3" title="纪念日" <#if wish.category=="3">checked="checked"</#if>>
                        <input type="radio" name="category" value="4" title="重要的人" <#if wish.category=="4">checked="checked"</#if>>
                        <input type="radio" name="category" value="5" title="其他" <#if wish.category=="5">checked="checked"</#if>>
                    </div>
                </div>
                <div class="layui-upload">
                    <div class="layui-upload-list">
                        <img class="layui-upload-img" id="demo1" src="${wish.giftPicture!}">
                        <p id="demoText"></p>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">可捐赠金额</label>
                    <div class="layui-input-block">
                        <input type="text" id="remainAmount" lay-verify="price" value="1280" autocomplete="off" placeholder="可捐赠金额" class="layui-input" readonly="readonly">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">捐赠金额</label>
                    <div class="layui-input-block">
                        <input type="text" name="donatePrice" id="donatePrice" lay-verify="price" autocomplete="off" placeholder="捐赠金额" class="layui-input" >
                    </div>
                    <fieldset class="layui-elem-field site-demo-button">
                        <legend>捐赠金额</legend>
                        <div class="layui-btn-group">
                            <button type="button" class="layui-btn" id="btn1">全部</button>
                            <button type="button" class="layui-btn" id="btn2">1/2</button>
                            <button type="button" class="layui-btn" id="btn3">1/5</button>
                            <button type="button" class="layui-btn" id="btn4">1/10</button>
                            <button type="button" class="layui-btn" id="btn5">1/20</button>
                        </div>
                    </fieldset>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">我和许愿人的关系</label>
                    <div class="layui-input-block">
                        <input type="radio" name="relation" value="1" title="朋友" checked="checked">
                        <input type="radio" name="relation" value="2" title="家人" >
                        <input type="radio" name="relation" value="3" title="重要的人" >
                        <input type="radio" name="relation" value="4" title="素人" >
                        <input type="radio" name="relation" value="5" title="其他" >
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">留言</label>
                    <div class="layui-input-block">
                        <textarea placeholder="留言" class="layui-textarea" name="donateMessage"></textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button type="submit" class="layui-btn" lay-submit="" lay-filter="fsubmit">提交捐赠</button>
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
            element = layui.element;
        $=layui.jquery;
        $(document).on('click','#btn1',function(){
            $("#donatePrice").val($("#remainAmount").val());
        });
        $(document).on('click','#btn2',function(){
            $("#donatePrice").val(Number($("#remainAmount").val())/2);
        });
        $(document).on('click','#btn3',function(){
            $("#donatePrice").val(Number($("#remainAmount").val())/5);
        });
        $(document).on('click','#btn4',function(){
            $("#donatePrice").val(Number($("#remainAmount").val())/10);
        });
        $(document).on('click','#btn5',function(){
            $("#donatePrice").val(Number($("#remainAmount").val())/20);
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
                url : '/wish/donate',
                type: "post",
                data : data.field,
                dataType : "json",
                success : function (o) {
                    if (o.status == 'success') {
                        layer.msg('捐赠成功。', {icon: 1});
                        window.setTimeout(function () {
                            window.location.href = "/wish/mine";
                        }, 3000);
                    }
                },
                error: function (o) {
                    layer.msg('捐赠失败，请稍候重试。', {icon: 2});
                }
            });
            return false;
        });

    });
</script>
</body>
</html>