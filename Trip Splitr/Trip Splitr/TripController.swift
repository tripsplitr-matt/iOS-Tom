//
//  TripController.swift
//  Trip Splitr
//
//  Created by Ryan Murphy on 5/28/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import Foundation

class TripController {

    func createTrip(name: String, date: String, img: String) {

        let newTrip = Trip(name: name, date: date, participants: [], baseCost: 0, img: img, expenses: [], paidBy: "",  complete: false)

        activeTrips.append(newTrip)

    }

    

//    func createPerson(name: String, img: String
//        let newPerson = 
//    
//    
//    )

    func createParticipant(name: String, img: String, currentTrip: Int) {

        let participant = Participant(name: name, img: img, spent: 0, used: 0)

        activeTrips[currentTrip].participants?.append(participant)


    }

    

    var allTrips: [Trip] = [Trip(name: "Germany", date: "10/16/18", participants: [], baseCost: 345, img: "https://www.topuniversities.com/sites/default/files/articles/lead-images/germany-view.jpg", expenses: [], paidBy: "", complete: true),Trip(name: "Iceland", date: "5/1/19", participants: [Participant(name: "Someone", img: "https://upload.wikimedia.org/wikipedia/commons/3/37/African_Bush_Elephant.jpg", spent: 0, used: 0)], baseCost: 1200, img: "https://www.telegraph.co.uk/content/dam/Travel/2019/March/Kirkjufell-iStock-959966730.jpg?imwidth=1400", expenses: [], paidBy: "", complete: false)]

    var activeTrips: [Trip] = []

    init() {
        activeTrips = liveTrips
    }

    var liveTrips: [Trip] {
        var trips: [Trip] = []
        for trip in allTrips {
            if trip.complete == false {
                trips.append(trip)
            }
        }
        return trips
    }


    
    var pastTrips: [Trip] {
        var trips: [Trip] = []
        for trip in allTrips {
            if trip.complete == true {
                trips.append(trip)
            }
        }
        return trips
    }

}
