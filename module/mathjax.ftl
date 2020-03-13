<#if (is_post?? || is_sheet??) && settings.enabled_mathjax!true>
    <script src="//cdn.jsdelivr.net/gh/hiparker/common-file/mathjax/unpacked/MathJax.js?config=TeX-MML-AM_CHTML" defer></script>

    <script>
    document.addEventListener('DOMContentLoaded', function () {
        MathJax.Hub.Config({
            'HTML-CSS': {
                matchFontHeight: false
            },
            SVG: {
                matchFontHeight: false
            },
            CommonHTML: {
                matchFontHeight: false
            },
            tex2jax: {
                inlineMath: [
                    ['$','$'],
                    ['\\(','\\)']
                ],
                displayMath: [["$$", "$$"], ["\\[", "\\]"]]
            }
        });
    });
    </script>
</#if>