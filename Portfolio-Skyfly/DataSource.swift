//
//  DataSource.swift
//  Portfolio-Skyfly
//
//  Created by Ling on 2021/9/9.
//

import SwiftUI



let selfLocation = "Kaohsiung"
let fromTime = Date()
func randomTime() -> Date {
    Calendar.current.date(byAdding: .hour, value: Int.random(in: 1...8), to: Date())!
}
func randomPrice() -> String {
    String(Int.random(in: 100...900))
}

enum TralvelTag {
    case all
    case airline
    case train
    case car
    case motorcycle
}

struct TralvelTagItem: Identifiable {
    let id = UUID()
    let tag: TralvelTag
    let name: String
}


struct Column: Identifiable {
    let id = UUID()
    var places = [Place]()
}


struct Place: Identifiable {
    let id = UUID()
    let height: CGFloat
    let imageName: String
    let title: String
    let tags: [TralvelTag]
    
    let tickets: [Ticket]
}

struct Ticket: Identifiable {
    let id = UUID()
    let tag: TralvelTag
    let title: String
    let price: String
    let fromLocation: String
    let fromTime: Date
    let toLocation: String
    let toTime: Date
    
}

let tralvelTagItems: [TralvelTagItem] = [
    TralvelTagItem(tag: .all,        name: "All"),
    TralvelTagItem(tag: .airline,     name: "Airline"),
    TralvelTagItem(tag: .train,      name: "Train"),
    TralvelTagItem(tag: .car,        name: "Car"),
    TralvelTagItem(tag: .motorcycle, name: "Moto"),
]


let placesData = [
    Place(height: 300, imageName: "taipel",
          title: "Taipel",
          tags: [.all, .car, .motorcycle, .train, .airline],
          tickets: [
            Ticket(tag: .airline,
                   title: "Chaina Airlines",
                   price: randomPrice(),
                   fromLocation: selfLocation,
                   fromTime: fromTime,
                   toLocation: "Taipel", toTime: randomTime()),
            Ticket(tag: .train,
                   title: "MOTC",
                   price: randomPrice(),
                   fromLocation: selfLocation,
                   fromTime: fromTime,
                   toLocation: "Taipel", toTime: randomTime()),
            Ticket(tag: .car,
                   title: "My Car",
                   price: randomPrice(),
                   fromLocation: selfLocation,
                   fromTime: fromTime,
                   toLocation: "Taipel", toTime: randomTime()),
            Ticket(tag: .motorcycle,
                   title: "U Moto",
                   price: randomPrice(),
                   fromLocation: selfLocation,
                   fromTime: fromTime,
                   toLocation: "Taipel", toTime: randomTime()),
            Ticket(tag: .motorcycle,
                   title: "U Moto",
                   price: randomPrice(),
                   fromLocation: selfLocation,
                   fromTime: fromTime,
                   toLocation: "Taipel", toTime: randomTime())
          ]),
    Place(height: 150,
          imageName: "taoyuan",
          title: "Taoyuan",
          tags: [.all, .car, .train, .airline],
          tickets: [
            Ticket(tag: .airline,
                   title: "Chaina Airlines",
                   price: randomPrice(),
                   fromLocation: selfLocation,
                   fromTime: fromTime,
                   toLocation: "Taoyuan", toTime: randomTime()),
            Ticket(tag: .train,
                   title: "MOTC",
                   price: randomPrice(),
                   fromLocation: selfLocation,
                   fromTime: fromTime,
                   toLocation: "Taoyuan", toTime: randomTime()),
            Ticket(tag: .car,
                   title: "My Car",
                   price: randomPrice(),
                   fromLocation: selfLocation,
                   fromTime: fromTime,
                   toLocation: "Taoyuan", toTime: randomTime())
          ]),
    Place(height: 150,
          imageName: "kaohsiung",
          title: "Kaohsiung",
          tags: [.all, .car, .motorcycle, .train, .airline],
          tickets: [
            Ticket(tag: .airline,
                   title: "Chaina Airlines",
                   price: randomPrice(),
                   fromLocation: selfLocation,
                   fromTime: fromTime,
                   toLocation: "Taipel", toTime: randomTime()),
            Ticket(tag: .airline,
                   title: "Chaina Airlines",
                   price: randomPrice(),
                   fromLocation: selfLocation,
                   fromTime: fromTime,
                   toLocation: "Taipel", toTime: randomTime()),
            Ticket(tag: .car,
                   title: "My Car",
                   price: randomPrice(),
                   fromLocation: selfLocation,
                   fromTime: fromTime,
                   toLocation: "Taipel", toTime: randomTime()),
            Ticket(tag: .motorcycle,
                   title: "U Moto",
                   price: randomPrice(),
                   fromLocation: selfLocation,
                   fromTime: fromTime,
                   toLocation: "Taipel", toTime: randomTime())
          ]),
    Place(height: 300,
          imageName: "pingtung",
          title: "Pingtung",
          tags: [.all, .car, .motorcycle, .train],
          tickets: [
            Ticket(tag: .car,
                   title: "My Car",
                   price: randomPrice(),
                   fromLocation: selfLocation,
                   fromTime: fromTime,
                   toLocation: "Taipel", toTime: randomTime()),
            Ticket(tag: .motorcycle,
                   title: "U Moto",
                   price: randomPrice(),
                   fromLocation: selfLocation,
                   fromTime: fromTime,
                   toLocation: "Taipel", toTime: randomTime())
          ]),
    Place(height: 200,
          imageName: "hualien",
          title: "Hualien",
          tags: [.all, .motorcycle, .train, .airline],
          tickets: [
            Ticket(tag: .airline,
                   title: "Chaina Airlines",
                   price: randomPrice(),
                   fromLocation: selfLocation,
                   fromTime: fromTime,
                   toLocation: "Taipel", toTime: randomTime()),
            Ticket(tag: .train,
                   title: "MOTC",
                   price: randomPrice(),
                   fromLocation: selfLocation,
                   fromTime: fromTime,
                   toLocation: "Taipel", toTime: randomTime()),
            Ticket(tag: .motorcycle,
                   title: "U Moto",
                   price: randomPrice(),
                   fromLocation: selfLocation,
                   fromTime: fromTime,
                   toLocation: "Taipel", toTime: randomTime()),
            Ticket(tag: .motorcycle,
                   title: "U Moto",
                   price: randomPrice(),
                   fromLocation: selfLocation,
                   fromTime: fromTime,
                   toLocation: "Taipel", toTime: randomTime())
          ]),
    Place(height: 150,
          imageName: "taichung",
          title: "Taichung",
          tags: [.all, .car, .motorcycle, .train],
          tickets: [
            Ticket(tag: .train,
                   title: "MOTC",
                   price: randomPrice(),
                   fromLocation: selfLocation,
                   fromTime: fromTime,
                   toLocation: "Taipel", toTime: randomTime()),
            Ticket(tag: .car,
                   title: "My Car",
                   price: randomPrice(),
                   fromLocation: selfLocation,
                   fromTime: fromTime,
                   toLocation: "Taipel", toTime: randomTime()),
            Ticket(tag: .motorcycle,
                   title: "U Moto",
                   price: randomPrice(),
                   fromLocation: selfLocation,
                   fromTime: fromTime,
                   toLocation: "Taipel", toTime: randomTime())
          ]),
    Place(height: 200,
          imageName: "taitung",
          title: "Taitung",
          tags: [.all, .car, .motorcycle, .train],
          tickets: [
            Ticket(tag: .train,
                   title: "MOTC",
                   price: randomPrice(),
                   fromLocation: selfLocation,
                   fromTime: fromTime,
                   toLocation: "Taipel", toTime: randomTime()),
            Ticket(tag: .train,
                   title: "MOTC",
                   price: randomPrice(),
                   fromLocation: selfLocation,
                   fromTime: fromTime,
                   toLocation: "Taipel", toTime: randomTime()),
            Ticket(tag: .car,
                   title: "My Car",
                   price: randomPrice(),
                   fromLocation: selfLocation,
                   fromTime: fromTime,
                   toLocation: "Taipel", toTime: randomTime()),
            Ticket(tag: .motorcycle,
                   title: "U Moto",
                   price: randomPrice(),
                   fromLocation: selfLocation,
                   fromTime: fromTime,
                   toLocation: "Taipel", toTime: randomTime())
          ]),
    Place(height: 150,
          imageName: "yilan",
          title: "Yilan",
          tags: [.all, .car, .motorcycle, .train],
          tickets: [
            Ticket(tag: .train,
                   title: "MOTC",
                   price: randomPrice(),
                   fromLocation: selfLocation,
                   fromTime: fromTime,
                   toLocation: "Taipel", toTime: randomTime()),
            Ticket(tag: .car,
                   title: "My Car",
                   price: randomPrice(),
                   fromLocation: selfLocation,
                   fromTime: fromTime,
                   toLocation: "Taipel", toTime: randomTime()),
            Ticket(tag: .motorcycle,
                   title: "U Moto",
                   price: randomPrice(),
                   fromLocation: selfLocation,
                   fromTime: fromTime,
                   toLocation: "Taipel", toTime: randomTime()),
            Ticket(tag: .motorcycle,
                   title: "U Moto",
                   price: randomPrice(),
                   fromLocation: selfLocation,
                   fromTime: fromTime,
                   toLocation: "Taipel", toTime: randomTime())
          ]),
    Place(height: 200,
          imageName: "nantou",
          title: "Nantou",
          tags: [.all, .car, .motorcycle],
          tickets: [
            Ticket(tag: .car,
                   title: "My Car",
                   price: randomPrice(),
                   fromLocation: selfLocation,
                   fromTime: fromTime,
                   toLocation: "Taipel", toTime: randomTime()),
            Ticket(tag: .car,
                   title: "My Car",
                   price: randomPrice(),
                   fromLocation: selfLocation,
                   fromTime: fromTime,
                   toLocation: "Taipel", toTime: randomTime()),
            Ticket(tag: .car,
                   title: "My Car",
                   price: randomPrice(),
                   fromLocation: selfLocation,
                   fromTime: fromTime,
                   toLocation: "Taipel", toTime: randomTime()),
            Ticket(tag: .motorcycle,
                   title: "U Moto",
                   price: randomPrice(),
                   fromLocation: selfLocation,
                   fromTime: fromTime,
                   toLocation: "Taipel", toTime: randomTime())
          ]),
]



