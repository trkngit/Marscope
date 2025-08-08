import UserNotifications

enum NotificationScheduler {
    static func requestPermission() async {
        do {
            let _ = try await UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound])
        } catch { }
    }

    static func scheduleDaily(hour: Int = 9) async {
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = NSLocalizedString("notif_title", comment: "")
        content.body = NSLocalizedString("notif_body", comment: "")
        content.sound = .default

        var date = DateComponents()
        date.hour = hour

        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
        let req = UNNotificationRequest(identifier: "daily.mars.vibe", content: content, trigger: trigger)
        try? await center.add(req)
    }
}
