#= require app_common/index

#= require_self

#= require_tree ./models
#= require_tree ./controllers


class AppClient extends Spine.Controller
  constructor: ->
    super

window.AppClient = AppClient


