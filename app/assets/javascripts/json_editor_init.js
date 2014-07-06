$( document ).ready(function() {
  // create the editor
  var container = document.getElementById("jsoneditor");
  if (container) {
    var editor = new JSONEditor(container);
    editor.set(window.settings_json_data);

    $('#json-form').on('submit', function(){
      var json = editor.get();
      $('#game_settings_json').val(JSON.stringify(json));

      return true;
    });

    $('#json_version_select').on('change', function(bla){
      var version = $( "#json_version_select option:selected" ).val();

      document.location = document.location.pathname + '?version=' + version;
    });

  }
});