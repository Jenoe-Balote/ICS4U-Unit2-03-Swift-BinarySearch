//
//  BinarySearch.swift
//
//  Created by Jenoe Balote
//  Created on 2021-12-06
//  Version 1.0
//  Copyright (c) 2021 Jenoe Balote. All rights reserved.
//
//  This program generates 250 random numbers in an array
//  and allows the user to search the array for a number.
//

import Foundation

let min = 0
let max = 999

// Binary search using recursion
func binarySearch(userArray: [Int], userNumber: Int,
                  lowIndex: Int, highIndex: Int) -> Int {

    var returnValue: Int

    if highIndex >= lowIndex {

        let mid = (highIndex + lowIndex) / 2

        // Checks to see if the user input is in the higher or lower
        // index.
        if userArray[mid] == userNumber {
            returnValue = mid
        } else if userArray[mid] > userNumber {
            returnValue =
                binarySearch(
                    userArray: userArray, userNumber: userNumber,
                    lowIndex: lowIndex, highIndex: mid - 1)
        } else {
            returnValue =
                binarySearch(
                    userArray: userArray, userNumber: userNumber,
                    lowIndex: mid + 1, highIndex: highIndex)
        }

    } else {
        returnValue = -1
    }

    return returnValue
}

// Generates 250 random numbers
func generateRandomArray() -> [Int] {
    let arraySize = 250

    var userArray = (0..<arraySize).map { _ in Int.random(in: min...max) }
    userArray.sort()

    return userArray
}

// Error message
func errorMessage() {
    print("ERROR: Invalid Input")
    print("\nDone.")
}

// Random array
let userArray = generateRandomArray()

// Prints array of random numbers
print("\nSorted list of numbers:\n")
for element in userArray {
    let padded = String(format: "%03d", element)
    print("\(padded), ", terminator: "")
}

// Input
print("\n\nWhat number are you searching for in the array"
    + "(integer between 0 and 999): ", terminator: "")

// Validates input making sure that the user inputted something
guard let searchNumberString = readLine(), !searchNumberString.isEmpty else {
    errorMessage()
    exit(001)
}

if let searchNumber = Int(searchNumberString) {

    // Makes sure the user inputted something in between within the limit given
    if searchNumber < min || searchNumber > max {
        errorMessage()
        exit(001)
    } else {

        // Gets the index of the number within the array
        let searchResult = binarySearch(
            userArray: userArray, userNumber: searchNumber,
            lowIndex: 0, highIndex: userArray.count - 1)

        if searchResult == -1 {
            print("The number isn't in the array!")
        } else {
            print("Your number is in index \(searchResult)")
        }
    }
} else {
    errorMessage()
    exit(001)
}

print("\nDone.")
