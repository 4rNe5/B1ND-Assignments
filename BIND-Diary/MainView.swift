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
                            DiaryCell(title: "2023년 06월 18일 (일) ", content: "다들 화이팅해서 과제 다 만들어보자!! 근데 난이도 어때?? 괜찮아..? 이거 난이도 조절을 살짝 잘 못한거 같긴 한데.. ㅎㅎ뭐 다들 잘하겠지 대소고 8기 iOS 다들 잘한다면서??")
                        }
                    }
                }
                .padding(.top,40)

                // 버튼 추가
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink(destination: WriteView()) {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .foregroundColor(Color("BBLUE"))
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
