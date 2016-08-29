# Custom UITableViewCells

![Earhart](http://i.imgur.com/YR989I2.jpg?1)

> The most effective way to do it, is to do it. -[Amelia Earhart](https://en.wikipedia.org/wiki/Amelia_Earhart)

## Overview 

In this lesson, we'll create and use a custom `UITableViewCell`
 
## Learning Objectives

* Create a custom `UITableViewCell`.
* Use  `UITableViewCell` by populating it with necessary information
* Explain that a prototype cell is used to set the design for the cells used by a particular table view
* List the three main elements of a table view cell
* Design and configure custom cells

## Table View Cells

The cells you have been using in your table view have so far been boring and uninspired. Where are the exciting cells like the ones in the Contacts app that show a contact's photo along with their name? Or even more exciting ones that have different text styles and show all sorts of useful information? Do your cells _have_ to have no more than a simple text label?

No! Table view cells are simply a _view_, and so you can display just about anything you want in them.

The Xcode project `CustomCellFun.xcodeproj` in this repo contains a sample app that uses custom cells to display all the tracks to Michael Jackson's _Thriller_ app. Open this project in Xcode and let's take a look at how you can create custom cells for your own apps.

## Custom Table View Cells

As with any other view, custom table view cells are designed and laid out in Interface Builder, using storyboards. Open up `Main.storyboard` to see an example of a custom table view cell. This storyboard contains one scene consisting of—you guessed it—a table view.

Take a look at the view marked **Prototype Cells** in `Main.storyboard`. It looks like this:

![Prototype cells](https://s3.amazonaws.com/learn-verified/prototype-custom-cell.png)

A _prototype cell_ is used to set the design for the cells used by a particular table view. Remember that cells are identified using a _reuse identifier_. This reuse identifier helps you to _dequeue_ a _reusable cell_ of the specific kind you want—a custom cell for a particular table view, for example.

Remember, too, that a cell is just a type of view, so you can add any other view elements that you want to it: Image views, labels, and so on. Can you identify the UI elements that make up this particular cell?

This table view's cells consist of three main elements:

1. An image view (`UIImageView`) that displays the album cover for _Thriller_
2. A label (`UILabel`) that displays the name of a track
3. Another, smaller label (also `UILabel`, of course) that displays the duration of a track.

These cells are just a _prototype_. The actual table view will have several of these cells. They'll all be laid out in the same way, except the labels will show the actual title and duration of a track. This prototype is used to build the cells used by this table.

Click on **friendCell** in the object listing and bring up the Identity Inspector for this table view's cells. Notice that these cells are backed by a _custom class_ called `SongCell`.

![`SongCell`](https://s3.amazonaws.com/learn-verified/song-cell.png)

Click on the grey arrow next to **`SongCell`** to bring up the definition of the class, which is in the file `SongCell.swift`. You should see this definition for `SongCell`:

```swift
class SongCell: UITableViewCell {
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var nameOfSongLabel: UILabel!
    @IBOutlet weak var lengthOfSongLabel: UILabel!
}
```

Notice that `SongCell` inherits from the class `UITableViewCell`, the _base class_ of all table view cells. This means that `SongCell` _is a_ `UITableViewCell`, but it also has some additional functionality and behavior beyond that of a run-of-the-mill table view cell.

For one thing, it has IB outlets, just like the view controllers you have worked with in several other lessons and labs. These IB outlets are connected to the individual UI elements of the cell: a `UIImageView` and two `UILabel`s. Just like any other view, a `UITableViewCell` can have IB outlets. It's just a view!

Open up `TableViewController.swift` in Xcode's editor. This, as you know, is the code that backs the table view controller itself. It has some properties and methods for creating the `Song` instances that store data for the _Thriller_ track listing.

Most of the code of `TableViewController` should be familiar to you by now. The only slightly new bit is in the `tableView(_:cellForRowAtIndexPath:)` method. Take a look:

```swift
override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath) as! SongCell
    cell.backgroundColor = UIColor.grayColor()
    let song = thrillerAlbum[indexPath.row]
    cell.nameOfSongLabel.text? = song.name
    cell.lengthOfSongLabel.text? = song.length
    return cell
}
```

As usual, this code dequeues a reusable cell using a reuse identifier. Keep in mind that the reuse identifier is attached to a cell of type `SongCell`, not just a generic `UITableViewCell` instance, so when a reusable cell is retrieved, it is _cast_ to a `SongCell`. And that's where things get a bit more intersting than what you've seen before. Pay special attention to these lines:

```swift
cell.backgroundColor = UIColor.grayColor()
let song = thrillerAlbum[indexPath.row]
cell.nameOfSongLabel.text? = song.name
cell.lengthOfSongLabel.text? = song.length
```

The first line changes the background color of the cell to grey. Nothing special here; a table view cell is just a view, and you can change the background color of any view. You could've changed the background color of the cells in other lessons, too. (In fact, you could even set the background color in the prototype cell `Main.storyboard`.)

The second line gets the song that corresponds to this cell from the track listing—no big surprises here, either.

The next two lines, however, are interesting. Remember those IB outlets in `SongCell`? The next two lines configure those outlets to display the name of the song and its duration. These IB outlet properties wouldn't be available on an "ordinary" `UITableViewCell`—they are unique to the `SongCell` class!

Build and run this sample app to see how your cells look in the actual app. You'll see something like this:

![_Thriller_ UI](https://s3.amazonaws.com/learn-verified/thriller-ui.png)

The key takeaway is that custom cells are little more than ordinary views, and can be designed and configured just like you would any other view. In the next lab, you'll design and code your own custom view cells.

<a href='https://learn.co/lessons/customcells' data-visibility='hidden'>View this lesson on Learn.co</a>
