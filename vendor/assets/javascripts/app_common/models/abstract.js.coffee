class AbstractModel extends Spine.Model

  # 
  # fix find method and isNew method bug
  # 
  @exists: (id) ->
    @findByAttribute('id', id)
  
 
  # 
  # issue#320
  # 
  @findById: (id)->
    id = parseInt(id)
    @findByAttribute('id', id)


  # 
  # model.rails
  # 
  # model.rails
  @extend Spine.Model.Rails
  @generateLocalizedMethods 'created_at', 'updated_at'

  @localized_at: (value) ->
    try
      I18n.l "time.formats.long", value
    catch error
      'N/A'



  # 
  # TypeError: 'this.method.name' 为空或不是对象
  # (in c:/Users/ivibj/Documents/Aptana Studio 3
  # 
  # don't use super in class method
  # 
  @fromJSON: (objects) ->
    return unless objects

    if typeof objects is 'string'
      objects = JSON.parse(objects)
      @fromJSON objects
      
    else if Spine.isArray(objects)
      (new @(value) for value in objects)

    else if typeof objects is 'object'
      if (collection = objects[@collectionName()]) and Spine.isArray(collection)
        (new @(value) for value in collection)
      else if (resource = objects[@resourceName()]) and typeof resource is 'object'
        new @(resource)
      else
        new @(objects)
    
    else
      new @(objects)


  # 
  # isChanged
  # 
  isChanged: ->
    tmprecord = if @isNew() then (new @constructor) else @constructor.find(@id)
    for attribute in @constructor.attributes
      if (@[attribute] || '') != (tmprecord[attribute] || '')
        return true
    false
  


  
Spine.AbstractModel = AbstractModel

