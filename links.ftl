<#include "module/macro.ftl">
<@layout title="${settings.links_title!'友链'} | ${blog_title!}">
    <div id="page" class="site ">
        <main class="site-main"  id="main">
            <div class="site-content">
                <header class="bg-cover page-header">
                    <#if settings.links_patternimg?? && settings.links_patternimg!=''>
                        <div class="cover-bg">
                            <img src="${settings.links_patternimg!}" alt="${settings.links_title!'友链'}">
                        </div>
                    <#else>
                        <div class="default-cover-bg">
                        </div>
                    </#if>
                    <div class="cover-content">
                        <div class="inner">
                            <div class="post-count"></div>
                            <h1 class="page-title" style="font-size: 46px;">${settings.links_title!'友链'}</h1>
                        </div>
                    </div>
                </header>
                <div class="links-box">
                    <div class="links-title">
                      <h2 id="span-stylecolor-e53a40申span请友链请先添加本站链接"><span style="color: #E53A40;">申</span>请友链请先添加本站链接：</h2> 
                      <blockquote>
                          <p>
                            站点名称：在码圈
                          </p>
                          <p>
                            链接：https://www.arcinbj.com
                          </p>
                          <p>
                            描述：代码改变未来，努力codeing
                          </p>
                          <p>
                            头像：https://www.arcinbj.com/avatar
                          </p>
                      </blockquote>
                      <h2 id="span-stylecolor-e53a40特span别说明"><span style="color: #E53A40;">特</span>别说明：</h2> 
                       <ul> 
                        <li>除博客、其他以外的链接，其余均是本人单向添加的链接</li> 
                        <li>所以目前设置是除了友情链接以外的链接都会自动添加上
  <span style="color: #E53A40;">rel="external nofollow"</span>属性</li> 
                        <li>当然这个是只针对于单向链接的，不会影响到友链。</li> 
                        <li>与本博客类型不同的注意留言说明！我好统计分类，谢谢配合！</li> 
                       </ul>
                    </div>  
                    <div class="links-items">
                        <@linkTag method="listTeams">
                            <#list teams as item>
                                <#if item.team?? && item.team!=''>
                                    <h3 style="width: 100%; margin: 10px;">${item.team}</h3>
                                </#if>

                                <#list item.links?sort_by('priority')?reverse  as link>
                                   <!-- 设定 rel="external nofollow" 属性针对于单向链接 -->  
                                   <#if link.description?? && !link.description?contains('no-display') >
                                    <a class="links-item" style="display: block;" href="${link.url}" target="_blank" onfocus="this.blur();">
									<#else>
                                    <a class="links-item" style="display: block;" href="${link.url}" target="_blank" onfocus="this.blur();"  rel="external nofollow">
                                   </#if> 
                                        <div class="media">
                                            <div class="media-left">
                                                <figure class="image is-64x64">
                                                    <#if link.logo?? && link.logo != ''>
                                                        <img src="${link.logo}" alt="${link.name}">
                                                    <#elseif settings.links_placeholder?? && settings.links_placeholder != ''>
                                                        <img src="${settings.links_placeholder}"
                                                             alt="${link.name}">
                                                    <#else>
                                                        <img src="https://cdn.jsdelivr.net/gh/hshanx/static@v1.0.1/placeholder.jpg"
                                                             alt="${link.name}">
                                                    </#if>
                                                </figure>
                                            </div>
                                            <div class="media-content">
                                                <p class="link-title">${link.name}</p>
                                                <p class="link-desc">${link.description}</p>
                                            </div>
                                        </div>
                                    </a>
                                </#list>
                            </#list>
                        </@linkTag>
                    </div>
                </div>
            </div>
			<section class="comments-area">
                <div class="inner" id="commentInnerLinks"></div>
            </section>
            <script>
                function getLocalStorage(key) {
                    var exp = 60 * 60 * 1000; // 一个小时的秒数
                    if (localStorage.getItem(key)) {
                        var vals = localStorage.getItem(key); // 获取本地存储的值
                        var dataObj = JSON.parse(vals); // 将字符串转换成JSON对象
                        // 如果(当前时间 - 存储的元素在创建时候设置的时间) > 过期时间
                        var isTimed = (new Date().getTime() - dataObj.timer) > exp;
                        if (isTimed) {
                            console.log("存储已过期");
                            localStorage.removeItem(key);
                            return null;
                        } else {
                            var newValue = dataObj.val;
                        }
                        return newValue;
                    } else {
                        return null;
                    }
                }

                function renderComment() {
                    const haloComment = document.getElementById('haloCommentLinks');
                    if (!haloComment) {
                        $('#' + '2').remove();
                        $('#commentInnerLinks').append('<div id="haloCommentLinks"></div>');
                    }

                    new Vue({
                        el: '#haloCommentLinks',
                        data() {
                            return {
                                configs: {
                                    darkMode: getLocalStorage('linksMode')
                                }
                            };
                        },
                        template: `<halo-comment id="18" type="sheet" :configs="JSON.stringify(configs)" />`,
                    });
                }

                renderComment();
            </script>
        </main>
    </div>
</@layout>
