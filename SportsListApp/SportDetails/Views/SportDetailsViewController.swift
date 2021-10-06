//
//  SportDetailsViewController.swift
//  SportsListApp
//
//  Created by Muhammad Salah on 10/5/21.
//

import UIKit

class SportDetailsViewController: UIViewController, SportDetailsViewProtocol {
    
    @IBOutlet weak var tvSportDescripition: UITextView!
    var presenter: SportDetailsPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.updateViewData()
    }
    
    func showSportData(sport: Sport)
    {
        title = sport.name
        tvSportDescripition.text = sport.description
    }
}
