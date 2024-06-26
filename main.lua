get("results").set_opacity(0)
local title = get('title', true)
local desc = get('desc', true)

function cut(s, l)
  return string.sub(s, 1, l) .. ((string.sub(s, 1, l) ~= s) and "..." or "")
end

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
  get("status").set_content('showing ' .. math.min(#res, 20) .. ' of ' .. #res .. ' results')
  get("results").set_opacity(1)
  for k = 1, 20 do
    local v = {}
    if #res < k then
      v = {}
    else
      v = res[k]
    end
    --title[k].set_href('buss://' .. v['url'])
    title[k].set_content((v['quality'] and "⭐ " or "") .. cut(v['title'], 20) .. ' - buss://' .. v['url'])
    desc[k].set_content(cut(v['desc'], 80))
  end
end)
