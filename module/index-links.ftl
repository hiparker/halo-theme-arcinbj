<!-- 首页友情链接 -->
<style>
    .index-links{
        border-top: 1px solid #34495e;
        text-align: left;
        padding-top: 8px;
        padding-bottom: 24px;
    }
    .index-links .links-title{
        color: #34495e;
        text-align: left;
        padding-bottom: 5px;
    }
    .index-links .links-content{
        text-align: left;
        padding-bottom: 25px;
    }
    .index-links .links-content a{
        margin-right: 5px;
    }
</style>
<div class="index-links" style=" display: none;">
    <p class="links-title"> 友情链接：</p> 
    <p class="links-content">
      <@linkTag method="listTeams">
        <#list teams as item>
           <#list item.links?sort_by('priority')?reverse  as link>
             <#if link.description?? && !link.description?contains('no-display') >
             <a href="${link.url}" target="_blank">${link.name}</a>
             </#if>
           </#list>  
        </#list>
      </@linkTag>
    </p>
</div>