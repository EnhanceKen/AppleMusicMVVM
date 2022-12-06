//
//  ViewController.swift
//  MusicMVVMCollection
//
//  Created by Consultant on 11/30/22.
//

import UIKit

class MusicViewController: UIViewController {

    let musicCell = "MusicCollectionViewCell"
    let musicAlbumViewModel = MusicAlbumViewModel()
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Music"
        self.collectionView.dataSource = self
        self.collectionView.layer.cornerRadius = 25
        self.collectionView.backgroundColor = .black
       
//        self.collectionView.delegate = self
//        self.collectionView.prefetchDataSource = self
        self.collectionView.register(UINib(nibName: "MusicCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: self.musicCell)
        
        if let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        
        self.musicAlbumViewModel.bind {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
        }
        
       self.musicAlbumViewModel.fetchPage()
    }
    
    
    
}

extension MusicViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.musicAlbumViewModel.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MusicCollectionViewCell", for: indexPath) as? MusicCollectionViewCell else {
//                print("could not make cell")
                return  UICollectionViewCell()}
            
            switch self.tabBarItem.tag {
            case 0:
                self.view.backgroundColor = .systemMint
                
                cell.layer.cornerRadius = 25
//                cell.img.layer.masksToBounds = true
//                cell.img.layer.cornerRadius = 15
                cell.albumLabel.text = self.musicAlbumViewModel.albumTitle(for: indexPath.row)
                cell.artistLabel.text = self.musicAlbumViewModel.artist(for: indexPath.row)
                self.musicAlbumViewModel.imageData(for: indexPath.row, completion: { data in
                    DispatchQueue.main.async {
                        if let data = data {
                            cell.img.image = UIImage(data: data)
                        }
                    }
                })
            case 1:

                self.view.backgroundColor = .systemPurple
                if cell.albumLabel.text == "Album Title"{
                    cell.isHidden = true
                }

            default:
                print("errr!")
            }
            return cell
        }

    }





extension MusicViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
//        let musicSelection = DetailViewController()
//
//          musicSelection.artist.text = self.musicAlbumViewModel.artist(for: indexPath.row)
//          musicSelection.album.text = self.musicAlbumViewModel.albumTitle(for: indexPath.row)
//          musicSelection.genre.text = self.musicAlbumViewModel.albumGenres(for: indexPath.row).compactMap({ elem in
//              elem.name
//          }).joined(separator: ", ")
//          musicSelection.releaseDate.text = dateReadable(date: self.musicAlbumViewModel.releaseDate(for: indexPath.row) ?? "")
        
        
        
        self.performSegue(withIdentifier: "detailSegue", sender: indexPath.row)
        //        print(indexPath)
    }
}
