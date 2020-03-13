<nav class="pagination" id="pagination">
    <h2 class="screen-reader-text">导航</h2>
    <div class="inner">
        <#if posts.hasPrevious()>
            <a class="newer-posts arrow-left" href="${context!}/page/${posts.number}"><span
                        class="screen-reader-text"></span></a>
        </#if>
        <span class="page-number">
            <a href="${context!}">当前第 ${posts.number + 1} 页， 共 ${posts.totalPages!} 页 </a>
        </span>
        <#if posts.hasNext()>
            <a class="older-posts arrow-right" href="${context!}/page/${posts.number+2}"><span
                        class="screen-reader-text"></span></a>
        </#if>
    </div>
</nav>
