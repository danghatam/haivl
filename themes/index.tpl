<script type="text/javascript" src="{$baseurl}/js/scroll.jquery.js"></script>
<div id="main">
    <div id="content-holder">        
        <div class="main-filter ">
            <ul class="content-type">
                <li> <a class="current" href="{$baseurl}/hot"><strong>{$lang172}</strong></a></li>
                <li> <a class="" href="{$baseurl}/trending"><strong>{$lang173}</strong></a></li>
                <li> <a class="" href="{$baseurl}/vote"><strong>{$lang174}</strong></a></li>                
            </ul>
            <a id="changeview" class="view_thumbs" href="{$baseurl}/hot?show=thumbs">{$lang258}</a>
            {if $smarty.session.USERID ne ""}
                {if $smarty.session.FILTER eq "1"}
                <a class="safe-mode-switcher on" href="{$baseurl}/safe?m={$eurl}">&nbsp;</a>
                {else}
                <a class="safe-mode-switcher off" href="{$baseurl}/safe?m={$eurl}&o=1">&nbsp;</a>
                {/if}
            {else}
            	<a class="safe-mode-switcher on" href="{$baseurl}/login">&nbsp;</a>
            {/if}
        </div>
        <div id="content" listPage="hot">            
            <div id="use-tips">
                <div id="view-info" class="list-tips">
                    <div id="shortcut-event-label" style="display:none">{$lang171}</div>
                    <span><b>{$lang169}</b>: {$lang170}</span>
                    <a href="#keyboard" class="keyboard_link">{$lang168}</a>                    
                </div>
            </div>
            <div id="entries-content" class="list">
                <ul id="entries-content-ul" class="col-1">
                    {section name=i loop=$posts}
                    {include file="posts_bit.tpl"}
                    {/section}                    
                </ul>
                <div id="lastPostsLoader"><img src="{$imageurl}/loading.gif" /></div>
                {literal}
                <script type="text/javascript">
				var tpage = 1;
				$(function(){
					$('#entries-content-ul').scrollPagination({
						'contentPage': '{/literal}{$baseurl}/{literal}indexmore.php',
						'contentData': {page:function() {return tpage}},
						'scrollTarget': $(window),
						'heightOffset': 10,
						'beforeLoad': function(){
							$('#lastPostsLoader').fadeIn();	
							tpage = tpage+1;
						},
						'afterLoad': function(elementsLoaded){
							 $('#lastPostsLoader').fadeOut();
							 var i = 0;
							 $(elementsLoaded).fadeIn();
						 	$('#backtotop').show();
						}
					});
				});
				</script>
                {/literal}  
            </div>	
        </div>
    </div>
</div>
{include file='vote_js.tpl'}
{include file='right.tpl'}  
<div id="footer" class="">