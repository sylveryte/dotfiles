local function get_date_string_for_month(s)
  local pattern = "(%d+)-(%d+)-"
  local y, m = s:match(pattern, 0)

  if y == nil or m == nil then
    return s
  end

  return y .. "-" .. m .. "-1"
end

return {
  get_date_string_for_month = get_date_string_for_month
}
