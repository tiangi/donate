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
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <form class="layui-form"  action="" lay-filter="register">
                <input type="hidden" name="wishId" value="${wish.id?c}">
                <div class="layui-form-item">
                    <label class="layui-form-label">可捐赠金额</label>
                    <div class="layui-input-block">
                        <input type="text" id="remainAmount" lay-verify="price" value="${leftMoney?string('0.##')}" autocomplete="off" placeholder="可捐赠金额" class="layui-input" readonly="readonly">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">捐赠金额</label>
                    <div class="layui-input-block">
                        <input type="text" name="amount" id="donatePrice" lay-verify="price" autocomplete="off" placeholder="捐赠金额" class="layui-input" >
                    </div>
                    <div class="layui-btn-group">
                        <button type="button" class="layui-btn" id="btn1">全部</button>
                        <button type="button" class="layui-btn" id="btn2">1/2</button>
                        <button type="button" class="layui-btn" id="btn3">1/5</button>
                        <button type="button" class="layui-btn" id="btn4">1/10</button>
                        <button type="button" class="layui-btn" id="btn5">1/20</button>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">我和许愿人的关系</label>
                    <div class="layui-input-block">
                        <input type="radio" name="relationship" value="1" title="朋友" checked="checked">
                        <input type="radio" name="relationship" value="2" title="家人" >
                        <input type="radio" name="relationship" value="3" title="重要的人" >
                        <input type="radio" name="relationship" value="4" title="素人" >
                        <input type="radio" name="relationship" value="5" title="其他" >
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">称呼</label>
                    <div class="layui-input-block">
                        <input type="text" name="name" value="" autocomplete="off" placeholder="姓名" class="layui-input" >
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">留言</label>
                    <div class="layui-input-block">
                        <textarea placeholder="留言" class="layui-textarea" name="message"></textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button type="submit" class="layui-btn" lay-submit="" lay-filter="fsubmit">提交捐赠</button>
                    </div>
                </div>
            </form>


        </div>



<script>

    layui.use(['form', 'layedit', 'laydate','element','upload', 'layer', 'element'], function(){
        var form = layui.form,
            layer = layui.layer,
            element = layui.element;
        $=layui.jquery;
        $(document).on('click','#btn1',function(){
            $("#donatePrice").val($("#remainAmount").val());
        });
        $(document).on('click','#btn2',function(){
            $("#donatePrice").val((Number($("#remainAmount").val())/2).toFixed(2));
        });
        $(document).on('click','#btn3',function(){
            $("#donatePrice").val((Number($("#remainAmount").val())/5).toFixed(2));
        });
        $(document).on('click','#btn4',function(){
            $("#donatePrice").val((Number($("#remainAmount").val())/10).toFixed(2));
        });
        $(document).on('click','#btn5',function(){
            $("#donatePrice").val((Number($("#remainAmount").val())/20).toFixed(2));
        });

        form.verify({
            title: function(value){
                if(value.length < 2){
                    return '礼物名称至少得2个字符';
                }
                if(value.length > 50){
                    return '礼物名称不能超过50个字符';
                }
            },price: function(value){
                if(!/^(([1-9]{1}\d*)|(0{1}))(\.\d{1,2})?$/.test(value)){
                    return '捐赠金额错误';
                }
            }
        });

        //监听提交
        form.on('submit(fsubmit)', function(data){
            $.ajax({
                url : '/donate/add',
                type: "post",
                data : data.field,
                dataType : "json",
                success : function (o) {
                    if (o.status == 'success') {
                        layer.msg('捐赠成功。', {icon: 1});
                        window.setTimeout(function () {
                            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                            parent.layer.close(index); //再执行关闭
                            window.parent.location.reload();
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