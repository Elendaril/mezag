{include file='header.tpl'}
<body{if $body_id} id="{$body_id|escape}"{/if}{if $body_class} class="{$body_class|escape}"{/if}>
    {include file='body_head.tpl'}
    <div class="main row">
        <div class="innermain container">
            <div class="s-row">
                {if 0 < $boxes_left_side|@count}
                    <div class="leftcol large s-grid-3">
                        {dynamic}
                            {foreach from=$boxes_left_side item=v key=k}
                                {box file="../boxes/$v/box.tpl" box="$k"}
                            {/foreach}
                        {/dynamic}
                    </div>
                {/if}
<div id="shipping_promo_bg"><img src="https://www.mezoko.com/skins/freeshipmentbaner.jpg" id="shipping_promo"></div>

<div id="promoContainer">
<div id="promo2" style="margin: 5px auto 5px auto;">
	<div class="mez-slider-promo" style="width: 100%">
		<img src="https://www.mezoko.com/promocja/elektroklubsmall.jpg" class="mez-slider-image">
			<div class="mez-slider-overlay">
            	<div class="mez-slider-text">
                	<a href="https://www.elektroklub.pl"><button class="mez-slider-promoButton">Zobacz</button>
                    </a>
                </div>
            </div>
	</div>
</div>
<div id="promo1" style="display:grid;margin: 5px auto 5px auto;">
    <div class="mez-slider-promo" style="width: 100%">
        <img src="https://www.mezoko.com/files/mezoko_wyceny.jpg" class="mez-slider-image">
            <div class="mez-slider-overlay">
                <div class="mez-slider-text">
                    <a href="https://www.mezoko.com/pl/i/Wycena-inwestycji/30"><button class="mez-slider-promoButton">Zobacz</button>
                    </a>
                </div>
            </div>
    </div>
</div>
      </div>   
      
      <div class="centercol s-grid-12">

            </div>
      
                <div class="centercol {if ($boxes_left_side|@count == 0) and ($boxes_right_side|@count == 0)}s-grid-12{elseif 0 != $boxes_left_side|@count and $boxes_right_side|@count != 0}s-grid-6{else}s-grid-9{/if}">
                    {dynamic}
                        {foreach from=$boxes_top_side item=v key=k}
                            {box file="../boxes/$v/box.tpl" box="$k"}
                        {/foreach}
                    {/dynamic}

                    {if $articles && count($articles) > 0}
                        {include file='news/listofarticles.tpl'}
                    {/if}

                    {if 'products' == $skin_settings->main->mode && count($products)}
                        <div class="box mainoverwrite" id="box_mainproducts">
                            <div class="boxhead">
                                <h1 class="category-name row"><img src="{baseDir}/public/images/1px.gif" alt="" class="px1">{translate key="Recommended products"}</h1>

                                <div class="sort-and-view">
                                    {if 1 == $skin_settings->productlist->allowviewchange}
                                        <ul class="prodview inline text-right">
                                            <li class="photo{if 'phot' == $view} selected{/if}">
                                                <a class="fa fa-th" href="{route function='indexpage' key=0 page=1 sort=1 view='phot'}{if $google}?{$google|escape}{/if}" title="{translate key='Picture view'}"></a>
                                            </li>
                                            <li class="full{if 'full' == $view} selected{/if}">
                                                <a class="fa fa-th-list" href="{route function='indexpage' key=0 page=1 sort=1 view='full'}{if $google}?{$google|escape}{/if}" title="{translate key='Full view'}"></a>
                                            </li>
                                        </ul>
                                    {/if}
                                </div>

                                <div class="row search-info">                
                                    {if 'search' == $list_type}
                                        <b class="count">{translate key='Products found'}: {$products->getTotalItemCount()}</b>
                                    {/if}
                                </div>
                            </div>
                            
                            <div class="innerbox">
                                    {include file='product/tableofproducts.tpl'}
                                    {if $products->getTotalItemCount() > $products->getItemCountPerPage()}
                                        <div class="floatcenterwrap row">
                                            {include file='paginator.tpl'}
                                        </div>
                                    {/if}
                            </div>
                        </div>
                    {/if}

                    {dynamic}
                        {foreach from=$boxes_bottom_side item=v key=k}
                            {box file="../boxes/$v/box.tpl" box="$k"}
                        {/foreach}
                    {/dynamic}
                </div>

                {if 0 < $boxes_right_side|@count}
                    <div class="rightcol large s-grid-3">
                        {dynamic}
                            {foreach from=$boxes_right_side item=v key=k}
                                {box file="../boxes/$v/box.tpl" box="$k"}
                            {/foreach}
                        {/dynamic}
                    </div>
                {/if}
            </div>
        </div>
    </div>
{include file='footerbox.tpl'}
{include file='footer.tpl' force_include_cache='1' force_include_cache_tags='Logic_SkinFooterGroupList,Logic_SkinFooterLinkList,Logic_SkinFooterGroup,Logic_SkinFooterLink'}
{plugin module=shop template=footer}
{include file='switch.tpl'}

<div id="id77" class="w3-modal" style="padding-top: 200px;display:none">
    <div class="w3-modal-content">
      <header class="w3-container w3-orange" style="background-color: #f37321"> 
        <span onclick="document.getElementById('id77').style.display='none';setLocal();" 
        class="w3-button w3-display-topright">X</span>
        <h2 style="color: white;padding: 10px;">Przerwa świąteczna</h2>
      </header>
      <div class="w3-container" style="padding: 20px;">
      <p>Informujemy, że w dniach od <b>02-01-2020</b> do <b>07-01-2020</b> będziemy przeprowadzać remanent naszych magazynów. W związku z tym zamówienia złożone <b>31-12-2019</b> po godzinie <b>12:00</b> będą przekazane do realizacji <b>08-01-2019</b>.</p>
      </div>
      <footer class="w3-container w3-orange">
      </footer>
    </div>
  </div>

  {literal}
      <script>
/*
if (typeof(Storage) !== "undefined") {
    if(localStorage.getItem('remanent2020') == null){
     document.getElementById('id77').style.display='block';   
            }else{}
} else {
}*/


function setLocal(){
        localStorage.setItem('remanent2020',1);
}



      </script>
  {/literal}
</body>
</html>