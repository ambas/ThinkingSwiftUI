#  Chapter 1
## View Builder

When reading the view it will be wrap with the latest modifier For example: 
```
Text("Hello").background(Color.blue).padding()

padding -> Background -> Text
           Color 
```
When apply modifier to the view that wrap with `Group` It might show the view applied modifer separately: For Example
```

    struct Goodbyle: View {
        var body: some View {
            Group {
                Image(systemName: "hand.wave")
                Text("Goodbye")
            }
        }
    }
            Goodbyle()
                .background(.blue)
                .border(.black)
```

## Render Trees
SwiftUI uses the view tree to construct a persistent render tree, 
`View Tree` is the tree that reflect the the SwiftUI code for example 
```
HStack {
    Image(systemName: "hand.wave") 
    if let g = greeting {
        Text(g) 
    }
}
    HStack
    |     |
Image    Text?
```

It can also be the dynamic content which will be shown or not wtheter the state of the condition

`Render Tree` is the actual view that will be rendered on the screen it will also take the actual state at the moment to condiser
```
    HStack
Image  Text?
 ✋     nil
 
 witht this the render tree will look like
 
      HStack
        |
      Image
 ```
 
 When greeting changes to a non-nil value, the view gets reconstructed, the part that will all be there will not be touch, for exmaple Stack and image, only text will be reconstruct. however the view tree is ephemeral

## Lifetime

The lifetime of nodes in the render tree isn’t the same as their visibility onscreen. The bottom line is that nodes in the render tree have a lifetime, but it’s not under our control.

For practical purposes, SwiftUI provides three hooks into lifetime events:
1. onAppear is executed each time a view appears onscreen. This can be called multiple times for one view even though the backing node in the render tree never went away. For example, if a view in a LazyVStack or List is scrolled offscreen and back onscreen repeatedly, onAppear will be called each time. The same is true when we switch tabs in a TabView: each time we switch to a tab, and not just the first time the tab is displayed, its onAppear will be called.
2. onDisappear is executed when a view disappears from the screen. This is the counterpart to onAppear and works using the same rules (it can be called multiple times even when the backing node doesn’t go away).
3. `task is a combination of the two used for asynchronous work. This modifier creates a new task at the point where onAppear would be called, and it cancels this task when onDisappear would be invoked.`

## Identity

Implicit identity is the order of the view herachy how it created.
Explicit identity mostly use in `ForEach` also we can defind explicit identity by using modifier `.id()`
explicit identifier will no replace implicit identity but will apply on top
