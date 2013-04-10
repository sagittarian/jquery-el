###
Copyright 2013 Adam Mesha <adam@mesha.org>
http://www.mesha.org
https://github.com/sagittarian/jquery-el
Released under the MIT license: http://opensource.org/licenses/MIT

Use like this:

    > $.el()
    [<div></div>]
    > $.el('.myclass.yourclass#uniq', {
      'data-item': 10, 
      text: 'Hello, world!'}).appendEl('a', {
        href: "http://example.com", 
        text: 'Click me!'})
    [<div class="myclass yourclass" id="uniq" data-item="10">
    "Hello, world!"
    <a href="http://example.com">Click me!</a>
    </div>]
    
###

jqel = ($) ->
  tagletters = 'a-zA-Z0-9'
  attrletters = tagletters + '_-'
  el = $.el = (tag='', attrs={}) ->
    classes = []
    split = tag.match ///^
      ([#{tagletters}]*)
      (([#.][#{attrletters}]+)*)
    $///
    tag = if split[1] then split[1] else 'div'
    if split[2]?
      signs = split[2].match ///([#.][#{attrletters}]+)///g
      if signs?
        for attr in signs 
          sigil = attr.slice 0, 1
          rest = attr.slice 1
          if sigil is '#' then id = rest else classes.push rest
    $el = $ document.createElement tag
    for cls in classes
      $el.addClass cls
    $el.attr 'id', id if id?
    for attr, val of attrs
      if attr is 'text' or attr is 'html' or attr is 'val'
        $el[attr] val 
      else 
        $el.attr attr, val 
    return $el
  
  $.fn.el = (tag, attrs) -> el(tag, attrs).appendTo this
  $.fn.appendEl = (tag, attrs) -> this.append el tag, attrs
  return el

if typeof define is 'function' and define.amd
  define ['jquery'], jqel
else
  jqel jQuery
