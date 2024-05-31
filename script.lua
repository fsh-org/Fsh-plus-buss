local api = 'http://eu2.host.hitbyathunder.xyz:20420/search?q='

function search()
  local res = fetch({
    url = api .. get("text").get_content(),
    method = "GET"
  })
end

get("text").on_submit(function()
    search()
end)
get("search").on_click(function()
    search()
end)
