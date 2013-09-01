# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  Morris.Line
    element: 'votes_chart'
    data: $('#votes_chart').data('posts')
    xkey: 'created_at'
    ykeys: ['yes', 'no']
    labels: ['Yes', 'No']