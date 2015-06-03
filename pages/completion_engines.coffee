
cleanUpRegexp = (re) ->
  re.toString()
    .replace /^\//, ''
    .replace /\/$/, ''
    .replace /\\\//g, "/"

DomUtils.documentReady ->
  html = ""
  for engine in CompletionEngines[0...CompletionEngines.length-1]
    engine = new engine
    html += "<h4>#{engine.constructor.name}</h4>\n"
    html += "<div class=\"engine\">"
    if engine.regexps
      html += "<pre>"
      html += "#{cleanUpRegexp re}\n" for re in engine.regexps
      html += "</pre>"
    if engine.prefix
      html += "<p>This uses the general Google completion engine, but adds the prefix \"<tt>#{engine.prefix.trim()}</tt>\" to the query.</p>"
    if engine.example
      html += "<p>"
      html += "Example search URL: \"<tt>#{engine.example}</tt>\"."
      html += "</p>"
    html += "</div>"

  document.getElementById("engineList").innerHTML = html


