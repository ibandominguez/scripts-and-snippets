/** JOS: Remaining fields
jos_content.title_alias
jos_content.mask
jos_content.catid
jos_content.created_by_alias
jos_content.modified_by
jos_content.checked_out
jos_content.checked_out_time
jos_content.publish_up
jos_content.publish_down
jos_content.images
jos_content.urls
jos_content.attribs
jos_content.version
jos_content.metakey
jos_content.metadesc
jos_content.access
jos_content.hits
jos_content.metadata
*/

select
  -- Regular columns
  jos_content.id as ID,
  jos_content.title as post_title,
  jos_content.alias as post_name,
  jos_content.introtext as post_excerpt,
  jos_content.created_by as post_author,
  jos_content.parentid as post_parent,
  jos_content.ordering as menu_order,
  -- Shorten strings
  substring(jos_sections.alias, 1, 20) as post_type,
  -- Conditional columns
  if(jos_content.fulltext = '' or jos_content.fulltext is null, jos_content.introtext, jos_content.fulltext) as post_content,
  if(jos_content.created = '0000-00-00 00:00:00', '2020-01-01 12:00:00', jos_content.created) as post_date,
  if(jos_content.created = '0000-00-00 00:00:00', '2020-01-01 12:00:00', jos_content.created) as post_date_gmt,
  if(jos_content.modified = '0000-00-00 00:00:00', '2020-01-01 12:00:00', jos_content.modified) as post_modified,
  if(jos_content.modified = '0000-00-00 00:00:00', '2020-01-01 12:00:00', jos_content.modified) as post_modified_gmt,
  -- Dynamic columns
  concat('http://localhost:9000/?id=', jos_content.id) as guid,
  -- Defaults columns
  'closed' as comment_status,
  '' as ping_status,
  '' as post_password,
  '' as to_ping,
  '' as pinged,
  '' as post_content_filtered,
  '' as post_mime_type,
  0 as comment_count,
  -- Cases columns
  case
    when jos_content.state = 0 then 'draft'
    when jos_content.state = 1 then 'publish'
    else 'trash'
  end as post_status
from jos_content
join jos_sections on jos_sections.id = jos_content.sectionid
