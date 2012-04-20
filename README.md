The Toolbox
===========


overview
--------

This is a collection of various useful classes and categories that I accumulated over time. Just take a look around and feel free to use and refine whatevers you want. You'll find short descriptions of the various elements below.


licence
-------

All sources are licenced under the MIT licence as reproduced below.

>Copyright (c) 2012 Michael Hörl
>
>Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
>
>The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
>
>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For brevity's sake, I only put a corresponding link into the source headers.


descriptions
------------

### NSSingletonObject

...is a singleton implementation as a direct subclass of NSObject, which means that you can turn any custom class that is derived from NSObject into a singleton simply by changing its superclass to NSSingletonObject.

The singleton base class can be used for multiple singletons inside the same scope. Any singleton based on it can also in turn be subclassed at will. Due to an optimized caching mechanism inside the -sharedInstance method, you can perform multiple consecutive calls to a specific singleton without any performance impact.

In other words:
```objective-c
Highlander *macLeod = [Highlander sharedInstance];
for (int i = 0; i < 100000000; i++)
  [macLeod doSomething];
```
..and..
```objective-c
for (int i = 0; i < 100000000; i++)
  [[Highlander sharedInstance] doSomething];
```
..have almost equal performance. Yes, I benchmarked it.

(BTW, I know I shouldn't have used the 'NS'-prefix for it but it just looks so nice in the interface declaration.. :) )
