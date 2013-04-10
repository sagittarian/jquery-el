jquery-el
=========

jQuery plugin to simplify quickly creating HTML elements.

Usage
-----

jquery-el defines one function on the global jQuery object, $.el, and two 
methods on jQuery objects.

The $.el function takes two arguments, a tag and an object with 
attribute-value pairs. The tag can optionally be followed by an
indication of the id and class or classes for the new element in the
form of #id.class.otherclass (in any order). If the tag is blank then
the default is to create a div element.

The two methods .el() and .appendEl() are added to jQuery objects
for convenience. They have the same signature as the global $.el function.
The first, .el(), creates a new element, appends it to the element it was
called on, and returns the new element. The second, .appendEl(), creates
a new element and appends it to the element it was called on, and returns
the old element (the parent of the new element) to facilitate chaining.

Among the attributes passed in the second argument, three are treated 
specially: text, html, and val. Instead of setting attributes on 
the new element, the jQuery function with the same name will be called,
allowing you to set the text, inner html, or value of the new element.

Some examples
-------------

    > $.el()
    [<div></div>]
    > $.el('.myclass')
    [<div class="myclass"></div>]
    > $.el('.myclass.yourclass')
    [<div class="myclass yourclass"></div>]
    > $.el('.myclass.yourclass#uniq')
    [<div class="myclass yourclass" id="uniq"></div>]
    > $.el('.myclass.yourclass#uniq', {'data-item': 10})
    [<div class="myclass yourclass" id="uniq" data-item="10"></div>]
    > $.el('.myclass.yourclass#uniq', {'data-item': 10, text: 'Hello, world!'})
    [<div class="myclass yourclass" id="uniq" data-item="10">
    Hello, world!</div>]
    > $.el('.myclass.yourclass#uniq', {
      'data-item': 10, 
      text: 'Hello, world!'}).appendEl('a', {
        href: "http://example.com", 
        text: 'Click me!'})
    [<div class="myclass yourclass" id="uniq" data-item="10">
    "Hello, world!"
    <a href="http://example.com">Click me!</a>
    </div>]

License
-------

MIT license.