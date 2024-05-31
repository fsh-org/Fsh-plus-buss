get('text').on_submit(function(content)
  get("results").set_content('search')
  local res = fetch({
    url = 'http://eu2.host.hitbyathunder.xyz:20420/search?q=' .. content,
    method = "GET"
  })
  print(content)
  get("results").set_content(res)
end)
