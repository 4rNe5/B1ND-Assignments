//
//  WriteView.swift
//  BIND-Diary
//
//  Created by 4rNe5 on 2023/08/16.
//

import SwiftUI
import RealmSwift

struct WriteView: View {
    @State var diaryWriteField: String = ""
    @Environment(\.presentationMode) var presentationMode // For Back Navigation
    
    var realm: Realm
    
    init() {
        do {
            realm = try Realm()
        } catch {
            fatalError("Failed to open Realm: \(error.localizedDescription)")
        }
    }
    
    var body: some View {
        ZStack {
            Color(red: 0.97, green: 0.97, blue: 0.97)
                .edgesIgnoringSafeArea(.all)
            VStack {
                RoundedRectangle(cornerRadius: 10)
                    .inset(by: 0.5)
                    .stroke(Color(red: 0.17, green: 0.4, blue: 0.71), lineWidth: 1)
                    .background(Color("WriteViewBG"))
                    .frame(width: 361, height: 160)
                    .overlay(content: {
                        VStack(alignment: .leading) {
                            TextArea(text: $diaryWriteField, placeholder: "일기를 작성해주세요.", maxLength: 100)
                                .padding(14)
                            
                            Spacer()
                            
                            ZStack(alignment: .leading) {
                                Text("\(nonWhitespaceCharacterCount(string: diaryWriteField)) / 100")
                                    .foregroundColor(Color("BBLACK"))
                                    .padding(.horizontal, 13)
                                    .padding(.bottom, 11)
                                    .fontWeight(.semibold)
                                
                                HStack {
                                    Spacer()
                                    Button(action: {
                                        saveDiaryEntry()
                                        presentationMode.wrappedValue.dismiss()
                                    }){
                                        Text("완료")
                                            .foregroundColor(Color("WriteViewColor"))
                                            .padding(.bottom, 11)
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                    }
                                    .padding(.trailing, 13)
                                }
                            }
                        }
                    })
                    .padding(.top, 20)
                Spacer()
            }
            .background(Color(red: 0.97, green: 0.97, blue: 0.97))
            .foregroundColor(Color("WriteViewBG"))
            .navigationBarBackButtonHidden(true)
            .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {
                                presentationMode.wrappedValue.dismiss() // For Back Navigation
                            }) {
                                HStack {
                                    Image(systemName: "arrow.backward")
                                    Text("일기 쓰기")
                                        .font(.system(size: 20))
                                        .fontWeight(.medium)
                                }
                                .foregroundColor(Color("BBLACK"))
                    }
                }
            }
        }
    }
        
        private func saveDiaryEntry() {
            let newEntry = DiaryEntry()
            
            realm.beginWrite()
            newEntry.id = (realm.objects(DiaryEntry.self).max(ofProperty: "id") as Int? ?? 0) + 1
            newEntry.date = formatDateToKorean(date: Date())
            newEntry.content = diaryWriteField
            realm.add(newEntry)
            try? realm.commitWrite()
        }
        
        
        private func formatDateToKorean(date: Date) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy년 M월 d일 (E)"
            dateFormatter.locale = Locale(identifier: "ko_KR")
            return dateFormatter.string(from: date)
        }
        
        private func nonWhitespaceCharacterCount(string: String) -> Int {
            return string.unicodeScalars.filter { !CharacterSet.whitespacesAndNewlines.contains($0) }.count
        }
    }

struct WriteView_Previews: PreviewProvider {
    static var previews: some View {
        WriteView()
    }
}
