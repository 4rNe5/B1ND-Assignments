//
//  MainView.swift
//  BIND-Diary
//
//  Created by 4rNe5 on 2023/08/17.
//

import SwiftUI

struct MainView: View {
    var postD: Int = 10
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView() {
                    VStack {
                        ForEach(1..<100) { _ in
                            DiaryCell(title: "2023년 06월 18일 (일) ", content: "대충 너무 길면 넘겨달라는 말")
                        }
                    }
                }
                .padding(.top)

                // 버튼 추가
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink(destination: LaunchScreenView()) {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .foregroundColor(.blue)
                                .padding()
                                .foregroundColor(Color.white)
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
