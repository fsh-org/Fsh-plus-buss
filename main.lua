get("results").set_opacity(0)
local title = get('title', true)
local desc = get('desc', true)

get('text').on_submit(function(content)
  get("status").set_content('searching...')
  get("results").set_opacity(0)
  local res = fetch({
    url = 'https://api.fsh.plus/buss?q='..content,
    method = "GET",
    headers = { ["Content-Type"] = "text/plain" },
    body = 'Text'
  })
  get("status").set_content('loaded')
  get("status").set_content(#res .. ' results')
  get("results").set_opacity(1)
  for k = 1, #res do
    local v = res[k]
    --title[k].set_href('buss://' .. v['url'])
    title[k].set_content(string.sub(v['title'], 1, 20) .. ' - buss://' .. v['url'])
    desc[k].set_content(string.sub(v['desc'], 1, 50))
  end
end)
