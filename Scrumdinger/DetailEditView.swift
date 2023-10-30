import SwiftUI

struct DetailEditView: View {
    @Binding var scrum: DailyScrum
    @State private var newAttendee = ""
    
    var body: some View {
        Form {
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $scrum.title)
                HStack {
                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1) {
                        Text("Length")
                    }
                    .accessibilityLabel("\(scrum.lengthInMinutes) minutes")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                        .accessibilityHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                }
                ThemePicker(selection: $scrum.theme)
            }
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete { indices in
                    scrum.attendees.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Attendee", text: $newAttendee)
                    Button(action: {
                        withAnimation {
                            let attendee = DailyScrum.Attendee(name: newAttendee)
                            scrum.attendees.append(attendee)
                            newAttendee = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    }
                    .disabled(newAttendee.isEmpty)
                }
            }
        }
    }
}

#Preview {
    DetailEditView(scrum: .constant(DailyScrum.sampleData[0]))
}
