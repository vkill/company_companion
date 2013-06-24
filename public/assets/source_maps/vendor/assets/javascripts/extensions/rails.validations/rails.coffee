###
Usage:


html:

<script type="text/javascript">
  window.ClientSideValidations.RecordValidators = {}
  window.ClientSideValidations.RecordValidators.friendly_link = <%= FriendlyLink.new.client_side_validation_hash.to_json.html_safe %>
</script>



js:

ClientSideValidations.validateAttribute 'friendly_link', 'name', 'a12345678901234567890123456', 
  failFunc: (message)->
    console.log "fail. msg:"+message
  passFunc: ->
    console.log "pass"
###



ClientSideValidations = @ClientSideValidations
ClientSideValidations.RecordValidators ||= {}
ClientSideValidations.validateAttribute = (resourceName, attribute, elementOrString, options={}) ->
  validatorsHash = options.validatorsHash || ClientSideValidations.RecordValidators[resourceName]?[attribute]
  return unless validatorsHash?

  if typeof(elementOrString) == 'string'
    element = $("<input type='hidden'/>").val(elementOrString).attr
      id: "#{resourceName}_#{attribute}"
      name: "#{resourceName}[#{attribute}]"
  else
    element = elementOrString
  
  element.on 'element:validate:before.ClientSideValidations', (e)->
    options.beforeFunc?()

  element.on 'element:validate:pass.ClientSideValidations', (e)->
    options.passFunc?()

  element.on 'element:validate:fail.ClientSideValidations', (e, message)->
    options.failFunc?(message)

  element.on 'element:validate:after.ClientSideValidations', (e)->
    options.afterFunc?()

  ClientSideValidations.validateElement(element, validatorsHash)




# 
# https://github.com/bcardarella/client_side_validations/pull/540
# 
ClientSideValidations.validateElement ||= (element, validators)->
  element.trigger('element:validate:before.ClientSideValidations');
  passElement = ->
    return element.trigger('element:validate:pass.ClientSideValidations').data('valid', null)
  
  failElement = (message) ->
    element.trigger('element:validate:fail.ClientSideValidations', message).data('valid', false)
    return false

  afterValidate = ->
    return element.trigger('element:validate:after.ClientSideValidations').data('valid') isnt false

  executeValidators = (context) ->
    valid = true
    for kind, fn of context
      if validators[kind]?
        for validator in validators[kind]
          if (message = fn.call(context, element, validator))
            valid = failElement(message)
            break
        unless valid
          break
    valid

  local = ClientSideValidations.validators.local
  remote = ClientSideValidations.validators.remote
  if executeValidators(local) && executeValidators(remote)
    passElement()
  return afterValidate()
