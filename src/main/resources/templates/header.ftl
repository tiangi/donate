<div class="layui-header layui-bg-green">
    <div class="layui-logo" style="font-size: 30px;font-weight: bold;left: 160px;color: #ffffff;">许愿台</div>
    <#if user??>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    ${(user.name)!}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="/wish/mine">我的愿望</a></dd>
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="/logout">退出</a></li>
        </ul>
    <#else >
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item"><a href="/logon_page">登录</a></li>
            <li class="layui-nav-item"><a href="/register">注册</a></li>
        </ul>
    </#if>
</div>

