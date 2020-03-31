<footer class="site-footer" id="siteFooter">
    <#if settings.Aplayer?? && settings.Aplayer != ''>
        <meting-js
                server="netease"
                type="playlist"
                fixed="true"
                id="${settings.Aplayer}">
        </meting-js>
    </#if>

    <div class="inner">
        <#-- 社交信息 begin -->
        <div class="offsite-links">
            <#if settings.sina??>
                <a href="${settings.sina!}" class="circle" target="_blank" rel="noopener">
                    <#include "icon/weibo.ftl">
                </a>
            </#if>
            <#if settings.qq??>
                <a href="//wpa.qq.com/msgrd?v=3&uin=${settings.qq!}&site=qq&menu=yes" class="circle" target="_blank" rel="noopener" title="QQ Chat">
                    <#include "icon/qq.ftl">
                </a>
            </#if>
            <#if settings.github??>
                <a href="${settings.github!}" class="circle" target="_blank" rel="noopener" title="Github">
                    <#include "icon/github.ftl">
                </a>
            </#if>
            <#if settings.zhihu??>
                <a href="${settings.zhihu!}" class="circle" target="_blank" rel="noopener" title="知乎">
                    <#include "icon/zhihu.ftl">
                </a>
            </#if>
            <#if settings.mail??>
                <a href="mailto:${settings.mail!}" class="circle" target="_blank" rel="noopener" title="邮箱">
                    <#include "icon/mail.ftl">
                </a>
            </#if>
             <#if settings.rss!true>
                <a href="${atom_url!}" class="circle" target="_blank" rel="noopener" title="RSS">
                    <#include "icon/rss.ftl">
                </a>
            </#if>
        </div>

        <#-- 社交信息 end -->

        <div class="site-info">
            <!-- 又拍云广告 -->
            <p>
              <a href="https://www.upyun.com/" target="_blank">
                <img src="https://www.arcinbj.com/upload/2020/3/%E5%8F%88%E6%8B%8D%E4%BA%91_logo5-d11f2774c95f4d328c8a3e675c126cda-3fb621faa5f4405d9dad95e321a5eca3.png" style="width:48px">
              </a> 
            </p>
          
            <#if settings.Icp??>
                <a href="http://beian.miit.gov.cn" target="_blank">${settings.Icp!}</a><br>
            </#if>
            <#if settings.PublicSecurityRecord??>
                <div style="display: inline-block;background-image: url(${static!}/assets/media/images/beian.png);background-repeat: no-repeat;background-position: top left;background-size: contain;padding-left: 20px;">
                    <a href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=${settings.PublicSecurityRecordCode!}" target="_blank">${settings.PublicSecurityRecord!}</a>
                </div><br>
            </#if>
            <@global.footer />
            <p>Copyright &copy; ${.now?string('yyyy')}
                <a href="${blog_url!}"> ${blog_title!}<#if settings.SiteSubtitle??> - ${settings.SiteSubtitle!}</#if></a>
            </p>
            <p>Powered by <a target="_blank" href="http://halo.run">Halo</a> •
                Theme by <a target="_blank" href="https://github.com/GalaxySuze/gridea-theme-subtle-galaxy">Subtle Galaxy</a> •
                REFERENCE FROM <a href="https://github.com/hshanx/halo-theme-hshan.git">寒山</a></p>
            <#if settings.TimeStatistics??>
                <p>本站运行：<span id="span_dt_dt"></span></p>
            </#if>
            <#if settings.visit_statistics!false>
                <p>
                    <span id="busuanzi_container_site_uv">感谢<span id="busuanzi_value_site_uv"></span>位小伙伴的</span>
                    <span id="busuanzi_container_site_pv"><span id="busuanzi_value_site_pv"></span>次访问</span>
                </p>
            </#if>
        </div>
        
        <!-- 首页友情链接 -->
        <#include "index-links.ftl">
          
        <a href="#page" class="arrow-up" data-scroll><span class="screen-reader-text">回到顶部</span></a>
    </div>
</footer>
<#include "search-box.ftl"/>
