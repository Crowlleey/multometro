//
//  DetailRoomViewController.swift
//  Mulltometro
//
//  Created by George Gomes on 23/10/18.
//  Copyright © 2018 CrowCode. All rights reserved.
//

import UIKit
import Rswift

class DetailViewController: UIViewController {
    
    var room: Room?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapCreateQR))

    }
    
    @objc func didTapCreateQR() {
        guard let room = room, let id = room.id else { return }
        performSegue(withIdentifier: R.segue.detailViewController.toQRView, sender: id)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationNavigationController = segue.destination as? QRViewController{
                destinationNavigationController.QRString = sender as? String
        }
        
    }
}
