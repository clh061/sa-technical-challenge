//
//  CHoskinsTechChallengeApp.swift
//  CHoskinsTechChallenge
//
//  Created by Christopher Hoskins on 8/6/25.
//

import SwiftUI
import IterableSDK

@main
struct CHoskinsTechChallengeApp: App {
    init() {
        let config = IterableConfig()
        // Customize config if needed
        IterableAPI.initialize(apiKey: "9129060e55c14b6eba32df2b10e7e0ce",
                               launchOptions:nil,
                               config: config)
        IterableAPI.email = "clh061@gmail.com"
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
