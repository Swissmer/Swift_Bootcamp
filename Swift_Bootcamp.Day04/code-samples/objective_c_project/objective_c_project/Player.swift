//
//  Player.swift
//  objective_c_project
//
//

import Foundation

@objc class Player: NSObject {
    @objc var name: String

    @objc init(name: String) {
        self.name = name
    }
}
