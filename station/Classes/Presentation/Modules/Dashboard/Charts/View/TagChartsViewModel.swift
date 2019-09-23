import UIKit

enum TagChartsType {
    case ruuvi
    case web
}

struct TagChartsPoint {
    var date: Date
    var value: Double
}

struct TagChartsViewModel {
    var type: TagChartsType = .ruuvi
    var uuid: Observable<String?> = Observable<String?>(UUID().uuidString)
    var name: Observable<String?> = Observable<String?>()
    var background: Observable<UIImage?> = Observable<UIImage?>()
    var celsius: Observable<[TagChartsPoint]?> = Observable<[TagChartsPoint]?>()
    var fahrenheit: Observable<[TagChartsPoint]?> = Observable<[TagChartsPoint]?>()
    var kelvin: Observable<[TagChartsPoint]?> = Observable<[TagChartsPoint]?>()
    var temperatureUnit: Observable<TemperatureUnit?> = Observable<TemperatureUnit?>()
    var humidityUnit: Observable<HumidityUnit?> = Observable<HumidityUnit?>()
    var relativeHumidity: Observable<[TagChartsPoint]?> = Observable<[TagChartsPoint]?>()
    var absoluteHumidity: Observable<[TagChartsPoint]?> = Observable<[TagChartsPoint]?>()
    var dewPointCelsius: Observable<[TagChartsPoint]?> = Observable<[TagChartsPoint]?>()
    var dewPointFahrenheit: Observable<[TagChartsPoint]?> = Observable<[TagChartsPoint]?>()
    var dewPointKelvin: Observable<[TagChartsPoint]?> = Observable<[TagChartsPoint]?>()
    var humidityOffset: Observable<Double?> = Observable<Double?>(0)
    var pressure: Observable<[TagChartsPoint]?> = Observable<[TagChartsPoint]?>()
    
    init(_ ruuviTag: RuuviTagRealm) {
        type = .ruuvi
        uuid.value = ruuviTag.uuid
        name.value = ruuviTag.name
        celsius.value = ruuviTag.data.sorted(byKeyPath: "date").compactMap({
            if let value = $0.celsius.value {
                return TagChartsPoint(date: $0.date, value: value)
            } else {
                return nil
            }
        })
        fahrenheit.value = ruuviTag.data.sorted(byKeyPath: "date").compactMap({
            if let value = $0.fahrenheit {
                return TagChartsPoint(date: $0.date, value: value)
            } else {
                return nil
            }
        })
        kelvin.value = ruuviTag.data.sorted(byKeyPath: "date").compactMap({
            if let value = $0.kelvin {
                return TagChartsPoint(date: $0.date, value: value)
            } else {
                return nil
            }
        })
        relativeHumidity.value = ruuviTag.data.sorted(byKeyPath: "date").compactMap({
            if let value = $0.humidity.value {
                return TagChartsPoint(date: $0.date, value: value)
            } else {
                return nil
            }
        })
    }
    
    init(_ webTag: WebTagRealm) {
        type = .web
        uuid.value = webTag.uuid
        name.value = webTag.name
        celsius.value = webTag.data.sorted(byKeyPath: "date").compactMap({
            if let value = $0.celsius.value {
                return TagChartsPoint(date: $0.date, value: value)
            } else {
                return nil
            }
        })
        fahrenheit.value = webTag.data.sorted(byKeyPath: "date").compactMap({
            if let value = $0.fahrenheit {
                return TagChartsPoint(date: $0.date, value: value)
            } else {
                return nil
            }
        })
        kelvin.value = webTag.data.sorted(byKeyPath: "date").compactMap({
            if let value = $0.kelvin {
                return TagChartsPoint(date: $0.date, value: value)
            } else {
                return nil
            }
        })
        relativeHumidity.value = webTag.data.sorted(byKeyPath: "date").compactMap({
            if let value = $0.humidity.value {
                return TagChartsPoint(date: $0.date, value: value)
            } else {
                return nil
            }
        })
    }
}