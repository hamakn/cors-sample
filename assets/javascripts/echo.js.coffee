window.onload = ->
  init()


init = ->
  success_callback = (res) -> success(res)
  error_callback = (d, msg) -> error(d, msg)
  $.ajax("https://cors-sandbox.herokuapp.com/api/echo.json", {
    type: "POST",
    data: {
      one: 1,
      two: 2,
    },
    dataType: "json",
    crossDomain: true,
    cache: false,
    xhrFields: {
      withCredentials: true,
    },
    success: success_callback,
    error: error_callback,
  })


success = (res) ->
  console.log "success!!"
  console.log res


error = (d, msg) ->
  console.log "error!!"
  console.log d
  console.log msg
