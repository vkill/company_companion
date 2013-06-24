ClientSideValidations = @ClientSideValidations
$ = @jQuery

# 
# https://github.com/ryanb/nested_form/wiki/Integrating-with-client_side_validations
# 
ClientSideValidations.formBuilders["NestedForm::Builder"] =
    ClientSideValidations.formBuilders["ActionView::Helpers::FormBuilder"]

ClientSideValidations.formBuilders['NestedForm::SimpleBuilder'] =
    ClientSideValidations.formBuilders['SimpleForm::FormBuilder']

ClientSideValidations.formBuilders['NestedForm::FormtasticBuilder'] = 
    ClientSideValidations.formBuilders['Formtastic::FormBuilder']


# 
# https://github.com/bcardarella/client_side_validations#local-validators
# 
ClientSideValidations.validators.local["email"] = (element, options) ->
  emailexp = /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  options.message unless emailexp.test(element.val())

# 
ClientSideValidations.validators.local["url"] = (element, options) ->
  protocols = options.protocols || ["http", "https"]
  protocols = Array(protocols) unless $.isArray(protocols)

  urlexp = new RegExp("(#{protocols.join('|')})://[\\w-]+(\\.[\\w-]+)+([\\w-.,@?^=%&:/~+#-]*[\\w@?^=%&;/~+#-])?")
  options.message unless urlexp.test(element.val())

# 
ClientSideValidations.validators.local["value_uniqueness"] = (element, options) ->
  options.message if options.values.indexOf(element.val()) isnt -1




