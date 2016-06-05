# ASCalendar
![alt tag](https://github.com/scamps88/ASCalendar/blob/master/Documentations/header.png)
### installation :

- Just copy the Example/Calendar folder to your project

- Or, if you are using CocoaPod, add the followind line to your Podfile (adding the use_frameworks! flag at the end) :
```script
    pod 'ASCalendar', :git => 'https://github.com/scamps88/ASCalendar.git'
    use_frameworks!
```
    
### implementation :
- To show a calendar in your current window simply add:
```swift
    let calendar = ASCalendar()
    calendar.showCalendarAsLayer()
```
- To check what day the user has selected use the ASCalendarDelegate (like in the example):
```swift
    calendar.delegate = self
```
```swift
    func calendarSelect(day: Int, week: Int, month: Int, year: Int) {
        NSLog("%d-%d-%d (%d)", day, month, year, week)
    }
```
-to close the calendar the user can tap outside it (like a popover) or you can manually close it calling:
```swift
    calendar.hideCalendar()
```
### settings :
- By defaul ASCalendar is set to give a day selection but you can also switch to week mode (in any time):
```swift
    calendar.setSelectionStyle(.Week)
```
- As italian I'm used to start the week with monday, but you can set to display sunday as first day in this way:
```swift
    calendar.setSundayFirstWeekDay(true)
    //or
    calendar.setMondayFirstWeekDay(false)
```
- to set a specific month-year to show, you can use at any time:
```swift
    //month: 06, year: 2035
    calendar.setcurrentPage(6, year: 2035)
```
- you can also set a specific interval in witch the user can select a day, disabling all the other days:
```swift
    //the range will start by day:15 month: 02, year: 2018
    calendar.setFirstSelectableDate(15, month: 2, year: 2018)
    //the upper limit of the selectable range will be day:20 month: 02, year: 2018
    calendar.setLastSelectableDate(20, month: 2, year: 2018)
```
- than, of course, you can set a specific day/week manually in this way:
```swift
    //set day or week selected by day:13 month: 04, year: 2044
    calendar.setSelectedDay(13, month: 04, year: 2044)
```
### customisations :
- You can customize the colors, the fonts, and set specific selection sizes of this calendar. In general the customisations functions start by "calendar.configure...". You should customize the calendar before showing it.

```swift
  func configureHeader(backgroundColor: UIColor?, textColor: UIColor?, textFont : UIFont?, separationLineColor: UIColor?)
  func configureBodyHeader(backgroundColor: UIColor?, textColor: UIColor?, textFont: UIFont?, separationLineColor: UIColor?)
  func configureBody(backgroundColor: UIColor?, monthTextColor: UIColor?, monthTextFont: UIFont?, separationLineColor: UIColor?)
  func configureDay(selectableTextColor: UIColor?, unselectableTextColor: UIColor?, selectedTextColor: UIColor?, TextFont: UIFont?)
  func configureSelections(selectionColor: UIColor?, daySelectionSize: CGFloat?, weekSelectionHeight: CGFloat?)
```

- There are also 4 defaults theme you can easily set with :
```swift
  calendar.theme.defaults(index)
```
### licence :

ASBubbleMenu is available under the MIT license. See the LICENSE file for more info.
