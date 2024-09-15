local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local f = ls.function_node

return {
  s(
    {
      trig = "js",
      name = "JSON tag",
      dscr = "Add json tag",
    },
    fmt("`json:\"{}\"`", {
      ls.i(1),
    })
  ),
  s(
    {
      trig = "vl",
      name = "Validate tag",
      dscr = "Add validate tag inside already a tag",
    },
    fmt("validate:\"{}\"", {
      ls.i(1),
    })
  ),
  s(
    {
      trig = "vlr",
      name = "Validate tag required",
      dscr = "Add validate tag inside already a tag",
    },
    ls.text_node("validate:\"required\"")
  ),
  s(
    {
      trig = "grj",
      name = "Read json",
      dscr = "Read json with bells n wistles",
    },
    fmt([[
	er := h.ReadJSON(&payload, w, r)
	if er != nil {{
		fmt.Println("Error ", er)
		h.ErrorResponse(er, http.StatusBadRequest, "Incorrect payload", w)
		return
	}}
    ]], {}
    )
  ),
  s(
    {
      trig = "gvl",
      name = "Validate",
      dscr = "Validate based on tags",
    },
    fmt([[
	// validation
	ver := m.app.Validate.Struct(payload)
	if ver != nil {{
		fmt.Println("Some error in validatoin '", ver)
		h.ErrorResponse(ver, http.StatusBadRequest, "Incorrect payload", w)
		return
	}}

    ]], {}
    )
  ),
  s(
    {
      trig = "gwb",
      name = "Write json",
      dscr = "Write json back to api",
    },
    fmt([[
	// write back
	err := h.WriteJson(h.Success{{
		Msg: "{} successfully",
	}}, w)
	if err != nil {{
		fmt.Println("Error  writing ", err)
	}}

    ]], { ls.i(1) }
    )
  ),
  s(
    {
      trig = "gem",
      name = "Error msg",
      dscr = "ErrorResponse with msg",
    },
    fmt([[
		msg := "{}"
		h.ErrorResponse(fmt.Errorf(msg), {}, msg, w)
    ]], { ls.i(1),ls.i(2) }
    )
  ),
}
