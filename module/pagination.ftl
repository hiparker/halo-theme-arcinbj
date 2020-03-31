<nav class="pagination" id="pagination">
    <h2 class="screen-reader-text">分页导航</h2>
    <div class="inner">
        <#if pagination.hasPrev>
            <a class="newer-posts arrow-left" href="${pagination.prevPageFullPath!}" data-scroll data-ajax>
                <span class="screen-reader-text"></span>
            </a>
        </#if>
        <#list pagination.rainbowPages as number>
            <#if number.isCurrent>
                <span class="page-number">
                    <a href="${number.fullPath!}" data-scroll data-ajax>当前第 ${number.page!} 页，共 ${posts.totalPages!} 页</a>
                </span>
            </#if>
        </#list>
        <#if pagination.hasNext>
            <a class="older-posts arrow-right" href="${pagination.nextPageFullPath!}" data-ajax data-scroll>
                <span class="screen-reader-text"></span>
            </a>
        </#if>
    </div>
</nav>

