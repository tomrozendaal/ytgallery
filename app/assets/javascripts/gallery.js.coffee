# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  createGrid = (thumb) -> 
    window_width = $(window).width()
    window_height = $(window).height()
    
    thumb_views = $(thumb).attr("view_count")
    scale_factor = thumb_views / average_views
          
    #thumb_width = window_width  / grid * scale_factor
    #thumb_height = window_height / grid * scale_factor
    thumb_width = window_width  / grid
    thumb_height = window_height / grid
    
    $(thumb).css
      width: thumb_width
      height: thumb_height
      
  total_vids = $(".thumb").length
  grid = Math.sqrt(total_vids)
  
  
  all_viewcounts = []
  all_viewcounts.push $(thumb).attr("view_count") for thumb in $(".thumb")
  
  total_views = 0
  total_views += (Number) $(thumb).attr("view_count") for thumb in $(".thumb")
  
  average_views = Math.floor(total_views / total_vids)


  createGrid thumb for thumb in $(".thumb")
  $(window).resize ->
    createGrid thumb for thumb in $(".thumb")

