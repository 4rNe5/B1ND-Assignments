//
//  BIND_DiaryApp.swift
//  BIND-Diary
//
//  Created by 4rNe5 on 2023/08/16.
//

import SwiftUI

@main
struct BIND_DiaryApp: App {
    @State private var isLoading = true
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if isLoading {
                    LaunchScreenView()
                } else {
                    MainView()
                }
            }
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    isLoading = false
                }
            })
        }
    }
}
