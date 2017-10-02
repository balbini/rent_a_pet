document.addEventListener("turbolinks:load", function(){
  // $('.datepicker').pickadate({
  //   selectMonths: true, // Creates a dropdown to control month
  //   selectYears: 15, // Creates a dropdown of 15 years to control year,
  //   today: 'Today',
  //   clear: 'Clear',
  //   close: 'Ok',
  //   closeOnSelect: false // Close upon selecting a date,
  // });

  // var ready;
  // ready = function() {
  //   var engine = new Bloodhound({
  //     datumTokenizer: function(d) {
  //       console.log(d);
  //       return Bloodhound.tokenizers.whitespace(d.title);
  //     },
  //     queryTokenizer: Bloodhound.tokenizers.whitespace,
  //     remote: {
  //       url: '../jobs/autocomplete?query=%QUERY',
  //       wildcard: '%QUERY'
  //     }
  //   });
  //
  //   var promise = engine.initialize();
  //
  //   promise
  //   .done(function() { console.log('success!'); })
  //   .fail(function() { console.log('err!'); });
  //
  //   $('.typeahead').typeahead(null, {
  //     name: 'engine',
  //     displayKey: 'title',
  //     source: engine.ttAdapter()
  //   });
  // }
  //
  // $(document).ready(ready);
  // $(document).on('page:load', ready);
})
