$ = jQuery

class Annotator.Plugins.Markdown extends Delegator
  events:
    'annotationViewerShown': 'updateViewer'

  constructor: (element, options) ->
    if Showdown?
      super
      this.addEvents()
      @converter = new Showdown.converter()
    else
      console.error "To use the Markdown plugin, you must include Showdown into the page first."

  updateViewer: (e, viewerElement, annotations) =>
    textContainers = $(viewerElement).find('.' + @annotator.componentClassname('annotation-text'))

    for t in textContainers
      ann = $(t).parents('.' + @annotator.componentClassname('annotation')).data('annotation')
      markdown = @converter.makeHtml ann.text
      $(t).html markdown