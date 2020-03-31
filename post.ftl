<#include "module/macro.ftl">
<@layout title="${post.title!options.blog_title}">

    <div id="page" class="site post-template">
        <main class="site-main" id="main">
            <div id="readProgress">
                <div class="read-progress-bar" role="progressbar" style="width: 0"></div>
            </div>
            <div class="site-content post-page">
                <article class="post tag-getting-started" id="siteContent">
                    <#--                    <div id="postHeader"></div>-->
                    <header class="bg-cover post-header" id="postHeader">
                        <#if post.thumbnail?? && post.thumbnail!=''>
                            <div class="cover-bg">
                                <img src="${post.thumbnail!}" alt="${post.title!}"/>
                            </div>
                        <#else>
                            <div class="default-cover-bg">
                            </div>
                        </#if>
                        <div class="cover-content">
                            <div class="inner">
                                <div class="post-tags">
                                    <#if post.tags?? && post.tags?size gt 0>
                                        <#list post.tags as tag>
                                            <a href="${tag.fullPath!}" data-ajax>${tag.name!}
                                                &nbsp;&nbsp;&nbsp;</a>
                                        </#list>
                                    </#if>
                                </div>
                                <h1 class="post-title js-toc-ignore">${post.title}</h1>
                                <div class="post-meta">
                                    <span class="post-meta-wrap">
                                        <img class="author-avatar"
                                             srcset="${user.avatar!}, ${user.avatar!} 2x"
                                             src="${user.avatar!}" alt=""/>
                                        <span class="post-author">${post.visits} 次访问</span>
                                        <time class="published"
                                              datetime="${post.createTime?string("yyyy-MM-dd")}">${post.createTime?string("yyyy-MM-dd")}
                                        </time>
                                    </span>
                                    <div>${user.nickname!}</div>
                                </div>
                                <#if settings.enabled_visual_height!true>
                                    <a href="#post-content" class="arrow-down" data-scroll><span
                                                class="screen-reader-text">Scroll Down</span></a>
                                </#if>
                            </div>
                        </div>
                    </header>
                    <div class="post-inner">
                        <div class="article-body">
                            <div class="post-content article-content" id="post-content">
                                ${post.formatContent!}
                            </div>
                            <div id="tocFlag"></div>
                            <#if settings.post_toc!true>
                                <aside id="toc" class="toc"></aside>
                            </#if>
                        </div>
                        <div class="article-info" id="articleInfo">
                            <div class="extra-info extra-info-center">
                                <#if settings.QR_code_zfb?? || settings.QR_code_wx??>
                                    <button type="submit"
                                            class="appreciate-btn btn-primary font-bold rounded width-47 height-46 custom-color-solid-bg font-16-to-14"
                                            onclick="">
                                        <img src="${theme_base!}/assets/media/images/cuplogo-sm.png"
                                             class="right-mrgn-8 support-img" style="height: 16px"/>
                                        <span id="">支持</span>
                                    </button>
                                </#if>
                                <#if settings.social_share!false>
                                    <button class="btn-primary btn-primary-light font-bold rounded width-47 height-46 custom-color-secondary-bg share-btn "
                                            onclick="">
                                        <span id="">分享</span>
                                    </button>
                                </#if>
                            </div>
                            <div id="socialShare" class="no-show">
                                <div class="social-share" data-disabled="${settings.share_disabeld!''}"></div>
                            </div>
                            
                            <div class="article-copyright-info">
                                <#if settings.copyright_clean!true>
                                <p>© 本文著作权归作者所有，转载前请务必署名</p>
                                <#else>
                                <p>
                                  本文由 <a href="${blog_url!}">${user.nickname!}</a> 创作，如果您觉得本文不错，请随意赞赏<br>
                                  采用 <a href="https://creativecommons.org/licenses/by/4.0/" target="_blank" rel="external nofollow">知识共享署名4.0</a> 国际许可协议进行许可<br>
                                  您可以自由的转载和修改，但请务必注明文章来源并且不可用于商业目的。<br>
                                  本站部分内容收集于互联网，如果有侵权内容、不妥之处，请联系我们删除。敬请谅解！<br>
                                  原文链接：<a href="${post.fullPath!}">${post.fullPath!}</a><br>
                                  最后更新于：${post.editTime?string('yyyy-MM-dd HH:mm:ss')}
                                </p>
                                </#if>
                            </div>

                            <!-- 广告位置 -->
                            <#if settings.article_advertisement_switch=true>
                                <div class="article-ad-transverse">
                                  <a href="${settings.article_advertisement_url}" target="_blank">
                                    <img src="${settings.article_advertisement_imageaddr}" width="100%" height="100%" ondragstart="return false;">
                                  </a>
                                </div>
      						</#if>  
                              
                            <#include "module/comment.ftl">
                            <#if is_post??>
                                <@comment post,"post" />
                            <#elseif is_sheet??>
                                <@comment sheet,"sheet" />
                            </#if>
                        </div>
                    </div>
                </article>

                <#if settings.post_nepre!true>
                    <nav class="post-navigation" id="post-navigation">
                        <h2 class="screen-reader-text">导航</h2>
                        <div class="nav-links">
                            <#if prevPost??>
                                <a href="${prevPost.fullPath!}" data-ajax class="nav-previous">
                                    <#if prevPost.thumbnail?? && prevPost.thumbnail!=''>
                                        <div class="nav-bg ">
                                            <img src="${prevPost.thumbnail!}" alt=""/>
                                        </div>
                                    <#else>
                                        <div class="nav-bg default-cover-bg">
                                        </div>
                                    </#if>
                                    <div class="nav-inside">
                                        <span class="nav-before">上一篇</span>
                                        <span class="nav-title">${prevPost.title!}</span>
                                        <span class="nav-date"><time class="published"
                                                                     datetime="${prevPost.createTime?string("yyyy-MM-dd")}">${prevPost.createTime?string("yyyy-MM-dd")}
                                        </time></span>
                                    </div>
                                </a>
                            </#if>
                            <#if nextPost??>
                                <a href="${nextPost.fullPath!}" data-ajax class="nav-next">
                                    <#if nextPost.thumbnail?? && nextPost.thumbnail!=''>
                                        <div class="nav-bg ">
                                            <img src="${nextPost.thumbnail!}" alt=""/>
                                        </div>
                                    <#else>
                                        <div class="nav-bg default-cover-bg">
                                        </div>
                                    </#if>
                                    <div class="nav-inside">
                                        <span class="nav-before">下一篇</span>
                                        <span class="nav-title">${nextPost.title!}</span>
                                        <span class="nav-date"><time class="published"
                                                                     datetime="${nextPost.createTime?string("yyyy-MM-dd")}">${nextPost.createTime?string("yyyy-MM-dd")}
                                        </time></span>
                                    </div>
                                </a>
                            </#if>

                        </div>
                    </nav>
                </#if>
            </div>

        </main>
    </div>
</@layout>
