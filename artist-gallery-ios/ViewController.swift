//
//  ViewController.swift
//  artist-gallery-ios
//
//  Created by  Maksim Stogniy on 01.06.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var artists: [Artist] = []
    var filteredArtists: [Artist] = []
    
    let loader = ArtistsLoader()
    let tableView = UITableView()
    let searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Artists"
        view.backgroundColor = .white
        
        searchBar.delegate = self
        searchBar.sizeToFit()
        searchBar.placeholder = "Search by artist name"
        navigationItem.titleView = searchBar
        
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomCell")
        view.addSubview(tableView)
        
        if let loadedArtists = loader.loadArtists(from: "artists") {
            artists = loadedArtists
            filteredArtists = artists
            tableView.reloadData()
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredArtists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell
        let artist = filteredArtists[indexPath.row]
        cell.configure(with: artist)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let artist = filteredArtists[indexPath.row]
        let detailVC = DetailViewController(artist: artist)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredArtists = artists
        } else {
            filteredArtists = artists.filter { artist in
                let nameMatches = artist.name.lowercased().contains(searchText.lowercased())
                let workMatches = artist.works.contains { work in
                   work.title.lowercased().contains(searchText.lowercased())
                }
                return nameMatches || workMatches
            }
        }
        tableView.reloadData()
    }
}
