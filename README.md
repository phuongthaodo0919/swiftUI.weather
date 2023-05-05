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
### Time functions
* Parse TimeInterval to Date ```sunrise = Date(timeIntervalSince1970: TimeInterval(sunriseInterval))```
