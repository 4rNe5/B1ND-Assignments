//
//  MainView.swift
//  BIND-Diary
//
//  Created by 4rNe5 on 2023/08/16.
//

import SwiftUI
import RealmSwift

class DiaryEntry: Object, Identifiable {
    @Persisted(primaryKey: true) var id = 0
    @Persisted var date: String
    @Persisted var content: String
}

struct MainView: View {
    @ObservedResults(DiaryEntry.self) var diaryEntries

    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.97, green: 0.97, blue: 0.97)
                    .edgesIgnoringSafeArea(.all)
                ScrollView() {
                    VStack {
                        ForEach(diaryEntries) { diaryEntry in
                            DiaryCell(title: diaryEntry.date, content: diaryEntry.content)
                        }
                    }
                }
                .padding(.top, 40)

                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink(destination: WriteView()) {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .foregroundColor(Color("BBLUE"))
                                .overlay(
                                    Image(systemName: "plus")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.white)
                                )
                                .padding()
                        }
                    }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
