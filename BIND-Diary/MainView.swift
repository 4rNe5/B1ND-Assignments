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
                                .padding()
                                .foregroundColor(Color.white)
                        }
                    }
                }
            }
        }
    }
}
