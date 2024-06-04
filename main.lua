get("results").set_opacity(0)

get('text').on_submit(function(content)
  local url = get('url', true)
  local title = get('title', true)
  local desc = get('desc', true)
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
    print(k)
    local v = res[k]
    print(v)
    url[k].set_href('buss://' .. v['url'])
    title[k].set_content(v['title'])
    desc[k].set_content(v['text'])
  end
end)
