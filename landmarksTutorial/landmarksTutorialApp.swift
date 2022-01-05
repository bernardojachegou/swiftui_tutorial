//
//  landmarksTutorialApp.swift
//  landmarksTutorial
//
//  Created by Michel Franklin Silva Bernardo on 09/12/21.
//

import SwiftUI

@main
struct landmarksTutorialApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
