//
//  Player.swift
//  LOLCalendar
//
//  Created by 김민국 on 2020/11/13.
//

import Foundation

struct Player: Equatable, Hashable {
    let name: String
    let first_name: String
    let last_name: String
    let role: String
    let birthYear: Int
    let image_url: String
    
    init() {
        name = ""
        first_name = ""
        last_name = ""
        role = ""
        birthYear = 0
        image_url = ""
    }
    
    init (name: String , first_name: String, last_name: String, role: String, birthYear: Int, image_url: String) {
        self.name = name
        self.first_name = first_name
        self.last_name = last_name
        self.role = role
        self.birthYear = birthYear
        self.image_url = image_url
    }
}
