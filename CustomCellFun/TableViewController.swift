//
//  TableViewController.swift
//  CustomCellFun
//
//  Created by James Campagno on 6/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let reuseIdentifier = "friendCell"
    var thrillerAlbum: [Song] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createThrillerAlbum()
    }
    
    func createThrillerAlbum() {
        let firstTrack = Song(name: "Wanna Be Startin' Somethin", album: "Thriller", length: "6:03")
        let secondTrack = Song(name: "Baby Be Mine", album: "Thriller", length: "4:20")
        let thirdTrack = Song(name: "The Girl Is Mine", album: "Thriller", length: "3:42")
        let fourthTrack = Song(name: "Thriller", album: "Thriller", length: "5:57")
        let fifthTrack = Song(name: "Beat It", album: "Thriller", length: "4:18")
        let sixthTrack = Song(name: "Billie Jean", album: "Thriller", length: "4:54")
        let seventhTrack = Song(name: "Human Nature", album: "Thriller", length: "4:06")
        let eightTrack = Song(name: "P.Y.T. (Pretty Young Thing)", album: "Thriller", length: "3:59")
        let ninthTrack = Song(name: "The Lady in My Life", album: "Thriller", length: "5:00")
        
        thrillerAlbum = [firstTrack, secondTrack, thirdTrack, fourthTrack, fifthTrack, sixthTrack, seventhTrack, eightTrack, ninthTrack]
    }

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return thrillerAlbum.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SongCell
        
        cell.backgroundColor = UIColor.gray

        let song = thrillerAlbum[indexPath.row]
        
        cell.nameOfSongLabel.text? = song.name
        cell.lengthOfSongLabel.text? = song.length
        
        return cell
    }
 

}
