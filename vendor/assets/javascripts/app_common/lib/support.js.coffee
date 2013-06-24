Support =
  plurals:
    'category': 'categories'

  Inflector:
    singularize: (str) ->
      for k, v in Support.plurals
        return k if v == str
      str.replace(/s$/, '')

    underscore: (str) ->
      str.replace(/::/g, '/')
         .replace(/([A-Z]+)([A-Z][a-z])/g, '$1_$2')
         .replace(/([a-z\d])([A-Z])/g, '$1_$2')
         .replace(/-/g, '_')
         .toLowerCase()

    camelize: (str) ->
      _str = str.replace(/(_|-)/, ' ').toLowerCase().replace /(?=\b)\w/g, (e) ->
        e.toUpperCase()
      _str = _str.replace(/[ ]/, '')
      _str
      
    pluralize: (str) ->
      Support.plurals[str] || (str + 's')

    tableize: (className) ->
      Support.Inflector.pluralize(Support.Inflector.underscore(className))
    
  Text:
    truncate: (text, length=10, end='...') ->
      return unless text?
      text = String(text)
      if text.length <= length
        text
      else
        text.substring(0, length - end.length)+end

  Time:
    now: -> new Date
    
Spine.Support = Support