//= require jquery
//= require jquery_ujs
//= require_tree .

$.get( 'http://bar.dev/resources/', function( data ) {
  alert( data.msg );
});
