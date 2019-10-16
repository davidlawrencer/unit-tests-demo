//
//  Dog.swift
//  mvc-intro
//
//  Created by David Rifkin on 10/16/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import Foundation

struct DogWrapper: Codable {
    let dogs: [Dog]
}

struct Dog: Codable {
    let name: String

    private var dogTag: Int
    
    init(name: String, dogTag: Int) {
        self.name = name
        self.dogTag = dogTag
    }
//    
    static func getNewDogTag(existingDogs: [Dog]) -> Int {
        return 1
        //look through all the tags. get the next-highest value for a tag so that we can add it to a new dog
    }
    
    static func decodeDogs(from data: Data) -> [Dog]?{
        do {
            let dogWrapper = try JSONDecoder().decode(DogWrapper.self, from: data)
            return dogWrapper.dogs
        } catch {
            print(error)
            return nil
        }
    }
}
