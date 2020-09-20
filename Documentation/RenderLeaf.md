# Render HTML using [Leaf](https://github.com/vapor/leaf)

1. configure the app to use leaf
  - Add the dependencies to Package.swift

2. create a leaf template (HTML source as in index.leaf)

3. configure a route to return a view using leaf and the path to your leaf template
  - Use `EventLoopFuture<View>`
  - pass in the route to your leaf file (HTML source)
