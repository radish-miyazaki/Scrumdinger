import SwiftUI

struct CardView: View {
    let scrum: DailyScrum
    
    var body: some View {
        VStack {
            Text(scrum.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .accessibilityLabel("\(scrum.attendees.count) attendees")
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .labelStyle(.trailingIcon)
                    .accessibilityLabel("\(scrum.lengthInMinutes) minutes meeting")
            }.font(.caption)
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
    }
}

#Preview {
    let scrum = DailyScrum.sampleData[0]
    
    return CardView(scrum: scrum)
        .background(scrum.theme.mainColor)
        // not working ...
        .previewLayout(.fixed(width: 400, height: 60))
}

// However, below code is working
//struct CardView_Previews: PreviewProvider {
//    static var scrum = DailyScrum.sampleData[0]
//
//    static var previews: some View {
//        CardView(scrum: scrum)
//            .background(scrum.theme.mainColor)
//            .previewLayout(.fixed(width: 400, height: 60))
//    }
//}
