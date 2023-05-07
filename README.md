# Technic appplied
### Decode data
* Define the keys which is used for the decode the result from the API 
```
enum WeatherKeys: String, CodingKey {
        case temperature = "temp"
    }
```
* Get the nestest container from the parent container of the decoded object 
```
let container = try decoder.container(keyedBy: CodingKeys.self)
let weatherContainer = try container.nestedContainer(keyedBy: WeatherKeys.self, forKey: .weather)
let temperature = try weatherContainer.decode(Double.self, forKey: .temperature)
```
### Use environmentObject
* Create the ObservableObject class
```
class Store: ObservableObject {
    @Published var weatherList: [WeatherViewModel] = [WeatherViewModel]()
    
    func addWeather(_ weather: WeatherViewModel) {
        weatherList.append(weather)
    }
}
```
* Add the environmentObject to the specific class (e.g. main view app)
```
@main
struct swiftUI_weatherApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(Store())
        }
    }
}
```
* Inject and use it in a certain child class
```
struct AddWeatherView: View {
    @EnvironmentObject var store: Store
    ...
    store.addWeather(weatherVM)
```
* Add environmentObject to the Preview (if neaded)
```
struct AddWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        AddWeatherView().environmentObject(Store())
    }
}
```

### Time functions
* Parse TimeInterval to Date ```sunrise = Date(timeIntervalSince1970: TimeInterval(sunriseInterval))```
