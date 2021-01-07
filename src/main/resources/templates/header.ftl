<div class="layui-header layui-bg-green">
    <div class="layui-logo" style="font-size: 30px;font-weight: bold;left: 160px;color: #ffffff;">许愿台</div>


    <ul class="layui-nav layui-layout-left" style="left: 500px;">

        <li class="" lay-unselect="" style="padding: 10px 10px;float: left">
            <input type="text" placeholder="输入关键字..." autocomplete="off" class="layui-input layui-input-search" layadmin-event="serach" style="width: 300px;" lay-action="/index?keywords=">
        </li>
        <li class="" lay-unselect="" style="padding: 10px 0;float: left;">
            <button type="button" class="layui-btn layui-btn-normal">搜索</button>
        </li>
    </ul>

    <#if user??>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item"><a href="/index">首页</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">
                    ${(user.name)!}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="/wish/mine">我的愿望</a></dd>
<#--                    <dd><a href="">基本资料</a></dd>-->
                    <dd><a href="/logout">退出系统</a></dd>
                </dl>
            </li>

        </ul>
    <#else >
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item"><a href="/index">首页</a></li>
            <li class="layui-nav-item"><a href="/logon_page">登录</a></li>
            <li class="layui-nav-item"><a href="/register">注册</a></li>
        </ul>
    </#if>
</div>

