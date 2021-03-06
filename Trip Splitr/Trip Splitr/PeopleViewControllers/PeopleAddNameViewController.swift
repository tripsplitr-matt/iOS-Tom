//
//  PeopleAddNameViewController.swift
//  Trip Splitr
//
//  Created by Ryan Murphy on 5/29/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import UIKit

class PeopleAddNameViewController: UIViewController {

    @IBAction func addButtonPressed(_ sender: Any) {
        self.view.endEditing(true)
        name = addNameTextField.text ?? ""
        addPhotoButton.isEnabled = true
        performSegue(withIdentifier: "AddPersonPhoto", sender: sender)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        // Do any additional setup after loading the view.
    }
    

    private func setupViews() {
        
        view.backgroundColor = AppearanceHelper.lightBlue
        addNameTextField.backgroundColor = AppearanceHelper.lightGray
        
    }
    
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPersonPhoto" {
            let destinationVC = segue.destination as? PeopleAddPhotoViewController
            destinationVC?.name = name
            destinationVC?.participantController = participantController
            destinationVC?.currentTrip = currentTrip
            destinationVC?.tripController = tripController
        }
    }

    @IBOutlet weak var addPhotoButton: UIBarButtonItem!
    @IBOutlet weak var addNameTextField: UITextField!
    var name: String = " "
    var participantController: ParticipantController?
    var tripController: TripController?
    var currentTrip: Int?
    
    

}
