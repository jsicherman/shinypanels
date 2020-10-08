const layoutSettings = {
  minWidth: '600px',
  panelClass: 'panel',
  panelCollapsedClass: 'collapsed',
  panelHeaderTitleClass: 'panel-header-title',
  panelDismissClass: 'panel-header-dismiss',
  panelActiveClass: 'active',
  boxCollapsibleClass: 'box-collapsible-trigger',
};

function setPanelWidth(panel, reset) {
  if (!reset) {
    if (panel.data('width')) {
      panel.css('width', `${panel.data('width')}px`);
    } else {
      panel.css('flex-grow', 1);
      panel.css('min-width', layoutSettings.minWidth);
    }

    panel.find('.' + layoutSettings.panelBodyClass).css('display', '');
    panel.find('.' + layoutSettings.panelFooterClass).css('display', '');
  } else {
    if (!panel.data('width')) {
      panel.css('flex-grow', 0);
      panel.css('min-width', 0);
    }

    panel.css('width', 'auto');

    panel.find('.' + layoutSettings.panelBodyClass).css('display', 'none');
    panel.find('.' + layoutSettings.panelFooterClass).css('display', 'none');
  }
}

function updatePanels() {
  $('.' + layoutSettings.panelClass).each(function() {
    setPanelWidth($(this), $(this).hasClass(layoutSettings.panelCollapsedClass));

    $(this).off();
    $(this).click(function(event) {
      if($(this).hasClass(layoutSettings.panelCollapsedClass) && ($(event.target).hasClass(layoutSettings.panelCollapsedClass) || $(event.target).hasClass(layoutSettings.panelHeaderTitleClass))) {
        $(this).toggleClass(layoutSettings.panelCollapsedClass);
        setPanelWidth($(this));
      }
    });
  });

  $('.' + layoutSettings.panelDismissClass).each(function() {
    $(this).off();
    $(this).click(function() {
      $(this).parent().parent().toggleClass(layoutSettings.panelCollapsedClass);
      setPanelWidth($(this).parent().parent(), $(this).parent().parent().hasClass(layoutSettings.panelCollapsedClass));
    });
  });

  $('.' + layoutSettings.boxCollapsibleClass).each(function() {
    if($(this).next().hasClass(layoutSettings.panelActiveClass))
      $(this).next().css('maxHeight', $(this).next().prop('scrollHeight') + 'px');

    $(this).off();
    $(this).click(function() {
      $(this).toggleClass(layoutSettings.panelActiveClass);
      $(this).next().toggleClass(layoutSettings.panelActiveClass);

      if($(this).next().css('maxHeight'))
        $(this).next().css('maxHeight', '');
      else
        $(this).next().css('maxHeight', $(this).next().prop('scrollHeight') + 'px');
    });
  });
}

$(document).ready(function() {
  updatePanels();
});
