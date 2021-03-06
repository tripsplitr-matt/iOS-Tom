//
//  TripExpenseEventViewController.swift
//  Trip Splitr
//
//  Created by Ryan Murphy on 5/29/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import UIKit

class TripExpenseEventViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        // Do any additional setup after loading the view.
        guard let currentTrip = currentTrip,
            let tripController = tripController else { return }
        print("in addview currentTrip \(currentTrip)")
        print(tripController.activeTrips[currentTrip])

    }
    private func setupViews() {
        view.backgroundColor = AppearanceHelper.lightBlue
    
    }

    @IBAction func costButtonPressed(_ sender: Any) {

    }

    @IBAction func addButtonPressed(_ sender: Any) {
       
        guard let text = tripEventTextField.text else { return }
        event = text
        self.view.endEditing(true)
        performSegue(withIdentifier: "AddCost", sender: sender)
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "AddCost" {
            let destinationVC = segue.destination as? TripExpenseCostViewController
            destinationVC?.event = event
            destinationVC?.participantController = participantController
            destinationVC?.tripController = tripController
            destinationVC?.currentTrip = currentTrip
        }
    }

    var event: String = "..."
    @IBOutlet weak var tripEventTextField: UITextField!
    @IBOutlet weak var enterTripEventLabel: UILabel!
    var participantController: ParticipantController?
    var tripController: TripController?
    var currentTrip: Int?
    
}
