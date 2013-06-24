Spine.Model.RailsExtend =
  hasAttribute: (attribute) ->
    @attributes.indexOf('updated_at') != -1

  updateUpdatedAt: (self) ->
    if self.constructor.hasAttribute('updated_at')
      self.updated_at = self.constructor._now()

  updateCreatedAt: (self) ->
    if self.constructor.hasAttribute('created_at')
      self.created_at ||= self.constructor._now()

  
  generateLocalizedMethods: (attributes...) ->
    for attribute in attributes
      methodName = "localized_#{attribute}"
      @_generateLocalizedMethod(methodName, attribute)
  
  resourceName: ->
    Spine.Support.Inflector.underscore @className

  collectionName: ->
    Spine.Support.Inflector.tableize @className
  

  # private

  _now: -> new Date

  _generateLocalizedMethod: (name, attribute) ->
    @::[name] = ->
      try
        @constructor.localized_at @["#{attribute}"]
      catch error
        @["#{attribute}"]

  localized_at: (value) ->
    # try
    #   I18n.l "time.formats.long", value
    # catch error
    #   'N/A'
    (new Date(String(value))).toLocaleString()


Spine.Model.RailsInclude =

  hasAttribute: (attribute) ->
    @constructor.hasAttribute(attribute)
  
  resourceName: ->
    @constructor.resourceName()
  
  collectionName: ->
    @constructor.collectionName()


Spine.Model.Rails =
  extended: ->
    @extend Spine.Model.RailsExtend
    @include Spine.Model.RailsInclude

    @bind 'beforeUpdate', @updateUpdatedAt
    @bind 'beforeCreate', @updateUpdatedAt
    @bind 'beforeCreate', @updateCreatedAt


Spine.Model.Rails.Methods =
  extended: ->
    @extend Spine.Model.RailsExtend
    @include Spine.Model.RailsInclude
    
