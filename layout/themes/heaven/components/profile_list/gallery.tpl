{* component Profilelist *}

{canvas}

	{container stylesheet="profile_list.style" class="profile_list_contener"}
		
		{if $tabs}
			{menu type='tabs-small' items=$tabs}
		{/if}
		<div class="clr_div"></div>
		{component SearchResultCount}
		<div class="clearfix">
			{paging total=$paging.total on_page=$paging.on_page pages=$paging.pages exclude="new_search"}
			<div class="change_vm_cont"><a href="{$view_mode.href}"  class="{$view_mode.class}">{$view_mode.label}</a></div>
		</div>
		{counter start=1 skip=1 print=false assign='counter'}
		{foreach from=$list item=item}
		
			
		
			<div class="gallery_cont{if not ($counter % 3)}_third{/if}">
			
				{block}
					{block_cap}{/block_cap}
					<div class="profile_list_thumb">
						<div style="position: relative; z-index: 98">   
							{profile_thumb profile_id=$item.profile_id redirect_params=$item.url_params size=85}
						</div>
						<div class="membership_icon">{membership_icon profile_id=$item.profile_id}</div>
					</div>
					<div class="profile_list_info">
					        <div class="pgal_name">{$item.profile_label}</div>
						{$item.sex_label}

						{foreach from=$item.age item=age name=age_values }
						{$age}{if !$smarty.foreach.age_values.last},{/if}
						{/foreach}
						
						<div class="loc_value">
						{if $item.location.city}
						     <div>{$item.location.city},</div>
						{elseif !empty($item.location.custom_location)}
						     <div>{$item.location.custom_location},</div>
						{/if}

						{if $item.location.state}
						    <div>{$item.location.state},</div>
						{/if}

						{if $item.location.country}
						    <div>{$item.location.country}.</div>
						{/if}
						</div>
						{if $item.note}
						<div class='profile_note_value'>
						<span class="small">					
							{text %.components.profile_notes.note_about} {$item.profile_label}:
							{$item.note|truncate:52}
						</span>
						</div>
						{/if}	
						<div class="profile_activity_gallery">
							{if isset($item.activity_info.online)}
								{text %.profile.labels.activity}:
								{online_btn profile_id=$item.profile_id}
							{elseif $item.activity_info.item}
								{text %.profile.labels.activity}:
								{$item.activity_info.item_num}&nbsp;{$item.activity_info.item_label}
							{/if}
						</div>
					</div>
					<div class="clr_div"></div>
				{/block}
			</div>
		{counter}
			{if ($counter-1) == $ads_pos}
				{capture name=ads}{strip}
					{ads pos='profile_list'}
				{/strip}{/capture}
				{if $smarty.capture.ads}
					<div class="clr_div"></div>
					{block title=%.profile.list.ads_label class="profile_list_ads"}
						{$smarty.capture.ads}
					{/block}
				{/if}
			{/if}
		{/foreach}
		<br clear="all" />
		{paging total=$paging.total on_page=$paging.on_page pages=$paging.pages exclude="new_search"}
	{/container}
	
{/canvas}
