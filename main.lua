get("results").set_opacity(0)

get('text').on_submit(function(content)
  local favicon = get('favicon', true)
  local url = get('url', true)
  local title = get('title', true)
  local desc = get('desc', true)
  get("status").set_content('searching...')
  local res = fetch({
    url = 'https://api.fsh.plus/images/data/dingle.json',
    method = "GET"
  })
  get("status").set_content('loaded')
  get("status").set_content(#res .. ' results')
--  for k, v in res do
--    favicon[k].set_source(v['favicon'])
--    url[k].set_href('buss://' .. v['url'])
--    title[k].set_content(v['title'])
--    desc[k].set_content(v['desc'])
--  end
end)
