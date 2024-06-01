//
//  DetailViewController.swift
//  artist-gallery-ios
//
//  Created by  Maksim Stogniy on 01.06.2024.
//

import UIKit

class DetailViewController: UIViewController {
    
    var artist: Artist
    
    let tableView = UITableView()
    
    init(artist: Artist) {
        self.artist = artist
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = artist.name
        view.backgroundColor = .white
        
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(WorkTableViewCell.self, forCellReuseIdentifier: "workCell")
        view.addSubview(tableView)
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artist.works.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "workCell", for: indexPath) as! WorkTableViewCell
        let work = artist.works[indexPath.row]
        cell.workImageView.image = UIImage(named: work.image)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let work = artist.works[indexPath.row]
        let workDetailVC = WorkDetailViewController(work: work)
        present(workDetailVC, animated: true, completion: nil)
    }
}
