$("#cart").show().html "<%= escape_javascript(render @cart) %>"
_tr_current_update = $("#tr_current_update")
_origin_color = _tr_current_update.css 'color'

_tr_current_update.css 'color', 'green'

setTimeout(->
  _tr_current_update.css 'color', _origin_color
,
  1500)
