class Jugaadoo
  @log = (args...) -> console?.log?(args...)

  klass      = null
  iframeElem = null

  @getClass = -> klass

  initToggleVideo = ->
    link = $("#trailer-link")
    link.click (e) ->
      e.preventDefault()
      link.fadeOut "fast"
      $("#splash-image").fadeOut "fast", -> $("#iframe").fadeIn "fast"
      return false

  createIframe = (callback) ->
    iframeElem = $("<iframe src='http://player.vimeo.com/video/27611453' width='1000' height='563' frameborder='0'></iframe>")
    callback?()


  @init = ->
    klass = $("html").attr "class"
    if klass is "not-ie"
      initToggleVideo()
      createIframe -> $("#iframe").html iframeElem

window.Jugaadoo  = Jugaadoo
window.htmlClass = Jugaadoo.getClass
log              = Jugaadoo.log
window.log      ?= log





jQuery ->
  Jugaadoo.init()
