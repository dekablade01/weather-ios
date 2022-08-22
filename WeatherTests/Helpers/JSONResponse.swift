//
//  JSONResponse.swift
//  WeatherTests
//
//  Created by Issarapong Poesua on 21/8/22.
//

import Foundation

struct JSONResponse {
    
    static let weather = """
        {
            "weather": [
                {
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }
            ],
            "main": {
                "temp": 26.83,
                "humidity": 88
            },
            "name": "Bangkok",
        }
        """.utf8Data
    
    static let forecasts = """
        {
            "cod": "200",
            "message": 0,
            "cnt": 40,
            "list": [
                {
                    "dt": 1661050800,
                    "main": {
                        "temp": 82.72,
                        "feels_like": 89.73,
                        "temp_min": 82.72,
                        "temp_max": 86.76,
                        "pressure": 1005,
                        "sea_level": 1005,
                        "grnd_level": 1005,
                        "humidity": 77,
                        "temp_kf": -2.24
                    },
                    "weather": [
                        {
                            "id": 804,
                            "main": "Clouds",
                            "description": "overcast clouds",
                            "icon": "04d"
                        }
                    ],
                    "clouds": {
                        "all": 100
                    },
                    "wind": {
                        "speed": 8.72,
                        "deg": 241,
                        "gust": 12.62
                    },
                    "visibility": 10000,
                    "pop": 0.09,
                    "sys": {
                        "pod": "d"
                    },
                    "dt_txt": "2022-08-21 03:00:00"
                },
                {
                    "dt": 1661061600,
                    "main": {
                        "temp": 84.74,
                        "feels_like": 91.74,
                        "temp_min": 84.74,
                        "temp_max": 86.76,
                        "pressure": 1005,
                        "sea_level": 1005,
                        "grnd_level": 1003,
                        "humidity": 69,
                        "temp_kf": -1.12
                    },
                    "weather": [
                        {
                            "id": 804,
                            "main": "Clouds",
                            "description": "overcast clouds",
                            "icon": "04d"
                        }
                    ],
                    "clouds": {
                        "all": 100
                    },
                    "wind": {
                        "speed": 7.4,
                        "deg": 236,
                        "gust": 11.92
                    },
                    "visibility": 10000,
                    "pop": 0.13,
                    "sys": {
                        "pod": "d"
                    },
                    "dt_txt": "2022-08-21 06:00:00"
                },
                {
                    "dt": 1661072400,
                    "main": {
                        "temp": 83.44,
                        "feels_like": 89.29,
                        "temp_min": 83.44,
                        "temp_max": 83.44,
                        "pressure": 1003,
                        "sea_level": 1003,
                        "grnd_level": 1002,
                        "humidity": 70,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 500,
                            "main": "Rain",
                            "description": "light rain",
                            "icon": "10d"
                        }
                    ],
                    "clouds": {
                        "all": 100
                    },
                    "wind": {
                        "speed": 7.29,
                        "deg": 214,
                        "gust": 11.43
                    },
                    "visibility": 10000,
                    "pop": 0.4,
                    "rain": {
                        "3h": 0.12
                    },
                    "sys": {
                        "pod": "d"
                    },
                    "dt_txt": "2022-08-21 09:00:00"
                },
                {
                    "dt": 1661083200,
                    "main": {
                        "temp": 81.57,
                        "feels_like": 86.88,
                        "temp_min": 81.57,
                        "temp_max": 81.57,
                        "pressure": 1004,
                        "sea_level": 1004,
                        "grnd_level": 1003,
                        "humidity": 76,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 500,
                            "main": "Rain",
                            "description": "light rain",
                            "icon": "10n"
                        }
                    ],
                    "clouds": {
                        "all": 100
                    },
                    "wind": {
                        "speed": 5.77,
                        "deg": 281,
                        "gust": 15.21
                    },
                    "visibility": 10000,
                    "pop": 0.45,
                    "rain": {
                        "3h": 0.19
                    },
                    "sys": {
                        "pod": "n"
                    },
                    "dt_txt": "2022-08-21 12:00:00"
                },
                {
                    "dt": 1661094000,
                    "main": {
                        "temp": 80.76,
                        "feels_like": 85.53,
                        "temp_min": 80.76,
                        "temp_max": 80.76,
                        "pressure": 1006,
                        "sea_level": 1006,
                        "grnd_level": 1005,
                        "humidity": 78,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 804,
                            "main": "Clouds",
                            "description": "overcast clouds",
                            "icon": "04n"
                        }
                    ],
                    "clouds": {
                        "all": 100
                    },
                    "wind": {
                        "speed": 3.69,
                        "deg": 237,
                        "gust": 9.44
                    },
                    "visibility": 10000,
                    "pop": 0.09,
                    "sys": {
                        "pod": "n"
                    },
                    "dt_txt": "2022-08-21 15:00:00"
                },
                {
                    "dt": 1661104800,
                    "main": {
                        "temp": 79.34,
                        "feels_like": 79.34,
                        "temp_min": 79.34,
                        "temp_max": 79.34,
                        "pressure": 1006,
                        "sea_level": 1006,
                        "grnd_level": 1004,
                        "humidity": 78,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 804,
                            "main": "Clouds",
                            "description": "overcast clouds",
                            "icon": "04n"
                        }
                    ],
                    "clouds": {
                        "all": 100
                    },
                    "wind": {
                        "speed": 4.36,
                        "deg": 249,
                        "gust": 10.47
                    },
                    "visibility": 10000,
                    "pop": 0.01,
                    "sys": {
                        "pod": "n"
                    },
                    "dt_txt": "2022-08-21 18:00:00"
                },
                {
                    "dt": 1661115600,
                    "main": {
                        "temp": 78.44,
                        "feels_like": 79.79,
                        "temp_min": 78.44,
                        "temp_max": 78.44,
                        "pressure": 1005,
                        "sea_level": 1005,
                        "grnd_level": 1003,
                        "humidity": 81,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 500,
                            "main": "Rain",
                            "description": "light rain",
                            "icon": "10n"
                        }
                    ],
                    "clouds": {
                        "all": 100
                    },
                    "wind": {
                        "speed": 3.87,
                        "deg": 263,
                        "gust": 7.05
                    },
                    "visibility": 10000,
                    "pop": 0.76,
                    "rain": {
                        "3h": 0.41
                    },
                    "sys": {
                        "pod": "n"
                    },
                    "dt_txt": "2022-08-21 21:00:00"
                },
                {
                    "dt": 1661126400,
                    "main": {
                        "temp": 79.09,
                        "feels_like": 79.09,
                        "temp_min": 79.09,
                        "temp_max": 79.09,
                        "pressure": 1006,
                        "sea_level": 1006,
                        "grnd_level": 1005,
                        "humidity": 81,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 500,
                            "main": "Rain",
                            "description": "light rain",
                            "icon": "10d"
                        }
                    ],
                    "clouds": {
                        "all": 100
                    },
                    "wind": {
                        "speed": 2.77,
                        "deg": 187,
                        "gust": 4.14
                    },
                    "visibility": 10000,
                    "pop": 0.76,
                    "rain": {
                        "3h": 0.25
                    },
                    "sys": {
                        "pod": "d"
                    },
                    "dt_txt": "2022-08-22 00:00:00"
                },
                {
                    "dt": 1661137200,
                    "main": {
                        "temp": 85.32,
                        "feels_like": 91.54,
                        "temp_min": 85.32,
                        "temp_max": 85.32,
                        "pressure": 1008,
                        "sea_level": 1008,
                        "grnd_level": 1006,
                        "humidity": 65,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 500,
                            "main": "Rain",
                            "description": "light rain",
                            "icon": "10d"
                        }
                    ],
                    "clouds": {
                        "all": 100
                    },
                    "wind": {
                        "speed": 7.18,
                        "deg": 211,
                        "gust": 9.46
                    },
                    "visibility": 10000,
                    "pop": 0.53,
                    "rain": {
                        "3h": 0.38
                    },
                    "sys": {
                        "pod": "d"
                    },
                    "dt_txt": "2022-08-22 03:00:00"
                },
                {
                    "dt": 1661148000,
                    "main": {
                        "temp": 84.83,
                        "feels_like": 90.9,
                        "temp_min": 84.83,
                        "temp_max": 84.83,
                        "pressure": 1006,
                        "sea_level": 1006,
                        "grnd_level": 1005,
                        "humidity": 66,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 500,
                            "main": "Rain",
                            "description": "light rain",
                            "icon": "10d"
                        }
                    ],
                    "clouds": {
                        "all": 100
                    },
                    "wind": {
                        "speed": 8.16,
                        "deg": 241,
                        "gust": 9.19
                    },
                    "visibility": 10000,
                    "pop": 0.49,
                    "rain": {
                        "3h": 0.14
                    },
                    "sys": {
                        "pod": "d"
                    },
                    "dt_txt": "2022-08-22 06:00:00"
                },
                {
                    "dt": 1661158800,
                    "main": {
                        "temp": 82.04,
                        "feels_like": 86.95,
                        "temp_min": 82.04,
                        "temp_max": 82.04,
                        "pressure": 1005,
                        "sea_level": 1005,
                        "grnd_level": 1004,
                        "humidity": 72,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 500,
                            "main": "Rain",
                            "description": "light rain",
                            "icon": "10d"
                        }
                    ],
                    "clouds": {
                        "all": 100
                    },
                    "wind": {
                        "speed": 5.84,
                        "deg": 204,
                        "gust": 7.14
                    },
                    "visibility": 10000,
                    "pop": 0.25,
                    "rain": {
                        "3h": 0.1
                    },
                    "sys": {
                        "pod": "d"
                    },
                    "dt_txt": "2022-08-22 09:00:00"
                },
                {
                    "dt": 1661169600,
                    "main": {
                        "temp": 80.96,
                        "feels_like": 86.14,
                        "temp_min": 80.96,
                        "temp_max": 80.96,
                        "pressure": 1006,
                        "sea_level": 1006,
                        "grnd_level": 1005,
                        "humidity": 79,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 500,
                            "main": "Rain",
                            "description": "light rain",
                            "icon": "10n"
                        }
                    ],
                    "clouds": {
                        "all": 100
                    },
                    "wind": {
                        "speed": 3.96,
                        "deg": 209,
                        "gust": 7.11
                    },
                    "visibility": 10000,
                    "pop": 0.4,
                    "rain": {
                        "3h": 0.35
                    },
                    "sys": {
                        "pod": "n"
                    },
                    "dt_txt": "2022-08-22 12:00:00"
                },
                {
                    "dt": 1661180400,
                    "main": {
                        "temp": 80.24,
                        "feels_like": 84.74,
                        "temp_min": 80.24,
                        "temp_max": 80.24,
                        "pressure": 1009,
                        "sea_level": 1009,
                        "grnd_level": 1007,
                        "humidity": 80,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 804,
                            "main": "Clouds",
                            "description": "overcast clouds",
                            "icon": "04n"
                        }
                    ],
                    "clouds": {
                        "all": 100
                    },
                    "wind": {
                        "speed": 3.96,
                        "deg": 194,
                        "gust": 6.67
                    },
                    "visibility": 10000,
                    "pop": 0,
                    "sys": {
                        "pod": "n"
                    },
                    "dt_txt": "2022-08-22 15:00:00"
                },
                {
                    "dt": 1661191200,
                    "main": {
                        "temp": 79.05,
                        "feels_like": 79.05,
                        "temp_min": 79.05,
                        "temp_max": 79.05,
                        "pressure": 1008,
                        "sea_level": 1008,
                        "grnd_level": 1007,
                        "humidity": 78,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 804,
                            "main": "Clouds",
                            "description": "overcast clouds",
                            "icon": "04n"
                        }
                    ],
                    "clouds": {
                        "all": 100
                    },
                    "wind": {
                        "speed": 3.62,
                        "deg": 236,
                        "gust": 6.53
                    },
                    "visibility": 10000,
                    "pop": 0,
                    "sys": {
                        "pod": "n"
                    },
                    "dt_txt": "2022-08-22 18:00:00"
                },
                {
                    "dt": 1661202000,
                    "main": {
                        "temp": 78.24,
                        "feels_like": 79.39,
                        "temp_min": 78.24,
                        "temp_max": 78.24,
                        "pressure": 1007,
                        "sea_level": 1007,
                        "grnd_level": 1006,
                        "humidity": 77,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 804,
                            "main": "Clouds",
                            "description": "overcast clouds",
                            "icon": "04n"
                        }
                    ],
                    "clouds": {
                        "all": 100
                    },
                    "wind": {
                        "speed": 1.52,
                        "deg": 257,
                        "gust": 1.77
                    },
                    "visibility": 10000,
                    "pop": 0.08,
                    "sys": {
                        "pod": "n"
                    },
                    "dt_txt": "2022-08-22 21:00:00"
                },
                {
                    "dt": 1661212800,
                    "main": {
                        "temp": 78.55,
                        "feels_like": 79.77,
                        "temp_min": 78.55,
                        "temp_max": 78.55,
                        "pressure": 1008,
                        "sea_level": 1008,
                        "grnd_level": 1007,
                        "humidity": 78,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 804,
                            "main": "Clouds",
                            "description": "overcast clouds",
                            "icon": "04d"
                        }
                    ],
                    "clouds": {
                        "all": 100
                    },
                    "wind": {
                        "speed": 1.41,
                        "deg": 88,
                        "gust": 2.17
                    },
                    "visibility": 10000,
                    "pop": 0.16,
                    "sys": {
                        "pod": "d"
                    },
                    "dt_txt": "2022-08-23 00:00:00"
                },
                {
                    "dt": 1661223600,
                    "main": {
                        "temp": 85.78,
                        "feels_like": 90.68,
                        "temp_min": 85.78,
                        "temp_max": 85.78,
                        "pressure": 1009,
                        "sea_level": 1009,
                        "grnd_level": 1008,
                        "humidity": 60,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 804,
                            "main": "Clouds",
                            "description": "overcast clouds",
                            "icon": "04d"
                        }
                    ],
                    "clouds": {
                        "all": 100
                    },
                    "wind": {
                        "speed": 3.36,
                        "deg": 215,
                        "gust": 3.96
                    },
                    "visibility": 10000,
                    "pop": 0,
                    "sys": {
                        "pod": "d"
                    },
                    "dt_txt": "2022-08-23 03:00:00"
                },
                {
                    "dt": 1661234400,
                    "main": {
                        "temp": 92.1,
                        "feels_like": 97.16,
                        "temp_min": 92.1,
                        "temp_max": 92.1,
                        "pressure": 1007,
                        "sea_level": 1007,
                        "grnd_level": 1006,
                        "humidity": 47,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 803,
                            "main": "Clouds",
                            "description": "broken clouds",
                            "icon": "04d"
                        }
                    ],
                    "clouds": {
                        "all": 79
                    },
                    "wind": {
                        "speed": 4.36,
                        "deg": 251,
                        "gust": 4.12
                    },
                    "visibility": 10000,
                    "pop": 0.01,
                    "sys": {
                        "pod": "d"
                    },
                    "dt_txt": "2022-08-23 06:00:00"
                },
                {
                    "dt": 1661245200,
                    "main": {
                        "temp": 92.95,
                        "feels_like": 98.29,
                        "temp_min": 92.95,
                        "temp_max": 92.95,
                        "pressure": 1004,
                        "sea_level": 1004,
                        "grnd_level": 1003,
                        "humidity": 46,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 802,
                            "main": "Clouds",
                            "description": "scattered clouds",
                            "icon": "03d"
                        }
                    ],
                    "clouds": {
                        "all": 40
                    },
                    "wind": {
                        "speed": 6.13,
                        "deg": 208,
                        "gust": 5.21
                    },
                    "visibility": 10000,
                    "pop": 0.01,
                    "sys": {
                        "pod": "d"
                    },
                    "dt_txt": "2022-08-23 09:00:00"
                },
                {
                    "dt": 1661256000,
                    "main": {
                        "temp": 85.84,
                        "feels_like": 91.15,
                        "temp_min": 85.84,
                        "temp_max": 85.84,
                        "pressure": 1006,
                        "sea_level": 1006,
                        "grnd_level": 1005,
                        "humidity": 61,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 802,
                            "main": "Clouds",
                            "description": "scattered clouds",
                            "icon": "03n"
                        }
                    ],
                    "clouds": {
                        "all": 46
                    },
                    "wind": {
                        "speed": 8.84,
                        "deg": 173,
                        "gust": 10.65
                    },
                    "visibility": 10000,
                    "pop": 0.01,
                    "sys": {
                        "pod": "n"
                    },
                    "dt_txt": "2022-08-23 12:00:00"
                },
                {
                    "dt": 1661266800,
                    "main": {
                        "temp": 83.89,
                        "feels_like": 89.92,
                        "temp_min": 83.89,
                        "temp_max": 83.89,
                        "pressure": 1009,
                        "sea_level": 1009,
                        "grnd_level": 1007,
                        "humidity": 69,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 800,
                            "main": "Clear",
                            "description": "clear sky",
                            "icon": "01n"
                        }
                    ],
                    "clouds": {
                        "all": 10
                    },
                    "wind": {
                        "speed": 8.3,
                        "deg": 181,
                        "gust": 14.34
                    },
                    "visibility": 10000,
                    "pop": 0,
                    "sys": {
                        "pod": "n"
                    },
                    "dt_txt": "2022-08-23 15:00:00"
                },
                {
                    "dt": 1661277600,
                    "main": {
                        "temp": 82.45,
                        "feels_like": 88.83,
                        "temp_min": 82.45,
                        "temp_max": 82.45,
                        "pressure": 1008,
                        "sea_level": 1008,
                        "grnd_level": 1007,
                        "humidity": 76,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 802,
                            "main": "Clouds",
                            "description": "scattered clouds",
                            "icon": "03n"
                        }
                    ],
                    "clouds": {
                        "all": 28
                    },
                    "wind": {
                        "speed": 6.53,
                        "deg": 173,
                        "gust": 14
                    },
                    "visibility": 10000,
                    "pop": 0.08,
                    "sys": {
                        "pod": "n"
                    },
                    "dt_txt": "2022-08-23 18:00:00"
                },
                {
                    "dt": 1661288400,
                    "main": {
                        "temp": 81.59,
                        "feels_like": 88.03,
                        "temp_min": 81.59,
                        "temp_max": 81.59,
                        "pressure": 1007,
                        "sea_level": 1007,
                        "grnd_level": 1005,
                        "humidity": 81,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 500,
                            "main": "Rain",
                            "description": "light rain",
                            "icon": "10n"
                        }
                    ],
                    "clouds": {
                        "all": 79
                    },
                    "wind": {
                        "speed": 2.75,
                        "deg": 194,
                        "gust": 5.35
                    },
                    "visibility": 10000,
                    "pop": 0.24,
                    "rain": {
                        "3h": 0.23
                    },
                    "sys": {
                        "pod": "n"
                    },
                    "dt_txt": "2022-08-23 21:00:00"
                },
                {
                    "dt": 1661299200,
                    "main": {
                        "temp": 81.39,
                        "feels_like": 87.12,
                        "temp_min": 81.39,
                        "temp_max": 81.39,
                        "pressure": 1008,
                        "sea_level": 1008,
                        "grnd_level": 1007,
                        "humidity": 79,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 802,
                            "main": "Clouds",
                            "description": "scattered clouds",
                            "icon": "03d"
                        }
                    ],
                    "clouds": {
                        "all": 49
                    },
                    "wind": {
                        "speed": 2.59,
                        "deg": 269,
                        "gust": 5.19
                    },
                    "visibility": 10000,
                    "pop": 0.2,
                    "sys": {
                        "pod": "d"
                    },
                    "dt_txt": "2022-08-24 00:00:00"
                },
                {
                    "dt": 1661310000,
                    "main": {
                        "temp": 88.56,
                        "feels_like": 94.05,
                        "temp_min": 88.56,
                        "temp_max": 88.56,
                        "pressure": 1009,
                        "sea_level": 1009,
                        "grnd_level": 1007,
                        "humidity": 55,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 800,
                            "main": "Clear",
                            "description": "clear sky",
                            "icon": "01d"
                        }
                    ],
                    "clouds": {
                        "all": 8
                    },
                    "wind": {
                        "speed": 4.74,
                        "deg": 277,
                        "gust": 5.26
                    },
                    "visibility": 10000,
                    "pop": 0.04,
                    "sys": {
                        "pod": "d"
                    },
                    "dt_txt": "2022-08-24 03:00:00"
                },
                {
                    "dt": 1661320800,
                    "main": {
                        "temp": 94.17,
                        "feels_like": 100.18,
                        "temp_min": 94.17,
                        "temp_max": 94.17,
                        "pressure": 1006,
                        "sea_level": 1006,
                        "grnd_level": 1004,
                        "humidity": 45,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 802,
                            "main": "Clouds",
                            "description": "scattered clouds",
                            "icon": "03d"
                        }
                    ],
                    "clouds": {
                        "all": 33
                    },
                    "wind": {
                        "speed": 6.06,
                        "deg": 270,
                        "gust": 5.57
                    },
                    "visibility": 10000,
                    "pop": 0.29,
                    "sys": {
                        "pod": "d"
                    },
                    "dt_txt": "2022-08-24 06:00:00"
                },
                {
                    "dt": 1661331600,
                    "main": {
                        "temp": 95.14,
                        "feels_like": 101.57,
                        "temp_min": 95.14,
                        "temp_max": 95.14,
                        "pressure": 1003,
                        "sea_level": 1003,
                        "grnd_level": 1002,
                        "humidity": 44,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 804,
                            "main": "Clouds",
                            "description": "overcast clouds",
                            "icon": "04d"
                        }
                    ],
                    "clouds": {
                        "all": 100
                    },
                    "wind": {
                        "speed": 6.78,
                        "deg": 264,
                        "gust": 6.64
                    },
                    "visibility": 10000,
                    "pop": 0.09,
                    "sys": {
                        "pod": "d"
                    },
                    "dt_txt": "2022-08-24 09:00:00"
                },
                {
                    "dt": 1661342400,
                    "main": {
                        "temp": 89.67,
                        "feels_like": 96.8,
                        "temp_min": 89.67,
                        "temp_max": 89.67,
                        "pressure": 1004,
                        "sea_level": 1004,
                        "grnd_level": 1002,
                        "humidity": 56,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 803,
                            "main": "Clouds",
                            "description": "broken clouds",
                            "icon": "04n"
                        }
                    ],
                    "clouds": {
                        "all": 67
                    },
                    "wind": {
                        "speed": 5.93,
                        "deg": 191,
                        "gust": 8.21
                    },
                    "visibility": 10000,
                    "pop": 0.09,
                    "sys": {
                        "pod": "n"
                    },
                    "dt_txt": "2022-08-24 12:00:00"
                },
                {
                    "dt": 1661353200,
                    "main": {
                        "temp": 85.55,
                        "feels_like": 93.99,
                        "temp_min": 85.55,
                        "temp_max": 85.55,
                        "pressure": 1006,
                        "sea_level": 1006,
                        "grnd_level": 1005,
                        "humidity": 70,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 803,
                            "main": "Clouds",
                            "description": "broken clouds",
                            "icon": "04n"
                        }
                    ],
                    "clouds": {
                        "all": 65
                    },
                    "wind": {
                        "speed": 7.83,
                        "deg": 188,
                        "gust": 13.15
                    },
                    "visibility": 10000,
                    "pop": 0.05,
                    "sys": {
                        "pod": "n"
                    },
                    "dt_txt": "2022-08-24 15:00:00"
                },
                {
                    "dt": 1661364000,
                    "main": {
                        "temp": 83.93,
                        "feels_like": 92.34,
                        "temp_min": 83.93,
                        "temp_max": 83.93,
                        "pressure": 1005,
                        "sea_level": 1005,
                        "grnd_level": 1003,
                        "humidity": 76,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 803,
                            "main": "Clouds",
                            "description": "broken clouds",
                            "icon": "04n"
                        }
                    ],
                    "clouds": {
                        "all": 83
                    },
                    "wind": {
                        "speed": 8.37,
                        "deg": 189,
                        "gust": 16.17
                    },
                    "visibility": 10000,
                    "pop": 0.09,
                    "sys": {
                        "pod": "n"
                    },
                    "dt_txt": "2022-08-24 18:00:00"
                },
                {
                    "dt": 1661374800,
                    "main": {
                        "temp": 82.83,
                        "feels_like": 90.27,
                        "temp_min": 82.83,
                        "temp_max": 82.83,
                        "pressure": 1003,
                        "sea_level": 1003,
                        "grnd_level": 1002,
                        "humidity": 78,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 804,
                            "main": "Clouds",
                            "description": "overcast clouds",
                            "icon": "04n"
                        }
                    ],
                    "clouds": {
                        "all": 100
                    },
                    "wind": {
                        "speed": 4.94,
                        "deg": 243,
                        "gust": 11.12
                    },
                    "visibility": 10000,
                    "pop": 0.04,
                    "sys": {
                        "pod": "n"
                    },
                    "dt_txt": "2022-08-24 21:00:00"
                },
                {
                    "dt": 1661385600,
                    "main": {
                        "temp": 82.08,
                        "feels_like": 87.73,
                        "temp_min": 82.08,
                        "temp_max": 82.08,
                        "pressure": 1005,
                        "sea_level": 1005,
                        "grnd_level": 1003,
                        "humidity": 75,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 804,
                            "main": "Clouds",
                            "description": "overcast clouds",
                            "icon": "04d"
                        }
                    ],
                    "clouds": {
                        "all": 100
                    },
                    "wind": {
                        "speed": 4.85,
                        "deg": 264,
                        "gust": 8.86
                    },
                    "visibility": 10000,
                    "pop": 0.16,
                    "sys": {
                        "pod": "d"
                    },
                    "dt_txt": "2022-08-25 00:00:00"
                },
                {
                    "dt": 1661396400,
                    "main": {
                        "temp": 89.04,
                        "feels_like": 94.55,
                        "temp_min": 89.04,
                        "temp_max": 89.04,
                        "pressure": 1006,
                        "sea_level": 1006,
                        "grnd_level": 1004,
                        "humidity": 54,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 804,
                            "main": "Clouds",
                            "description": "overcast clouds",
                            "icon": "04d"
                        }
                    ],
                    "clouds": {
                        "all": 100
                    },
                    "wind": {
                        "speed": 6.17,
                        "deg": 262,
                        "gust": 7.72
                    },
                    "visibility": 10000,
                    "pop": 0.05,
                    "sys": {
                        "pod": "d"
                    },
                    "dt_txt": "2022-08-25 03:00:00"
                },
                {
                    "dt": 1661407200,
                    "main": {
                        "temp": 92.53,
                        "feels_like": 97.48,
                        "temp_min": 92.53,
                        "temp_max": 92.53,
                        "pressure": 1003,
                        "sea_level": 1003,
                        "grnd_level": 1002,
                        "humidity": 46,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 804,
                            "main": "Clouds",
                            "description": "overcast clouds",
                            "icon": "04d"
                        }
                    ],
                    "clouds": {
                        "all": 100
                    },
                    "wind": {
                        "speed": 5.61,
                        "deg": 257,
                        "gust": 8.32
                    },
                    "visibility": 10000,
                    "pop": 0.09,
                    "sys": {
                        "pod": "d"
                    },
                    "dt_txt": "2022-08-25 06:00:00"
                },
                {
                    "dt": 1661418000,
                    "main": {
                        "temp": 91.6,
                        "feels_like": 98.26,
                        "temp_min": 91.6,
                        "temp_max": 91.6,
                        "pressure": 1002,
                        "sea_level": 1002,
                        "grnd_level": 1000,
                        "humidity": 51,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 804,
                            "main": "Clouds",
                            "description": "overcast clouds",
                            "icon": "04d"
                        }
                    ],
                    "clouds": {
                        "all": 100
                    },
                    "wind": {
                        "speed": 8.08,
                        "deg": 181,
                        "gust": 8.08
                    },
                    "visibility": 10000,
                    "pop": 0.01,
                    "sys": {
                        "pod": "d"
                    },
                    "dt_txt": "2022-08-25 09:00:00"
                },
                {
                    "dt": 1661428800,
                    "main": {
                        "temp": 85.82,
                        "feels_like": 93.4,
                        "temp_min": 85.82,
                        "temp_max": 85.82,
                        "pressure": 1003,
                        "sea_level": 1003,
                        "grnd_level": 1002,
                        "humidity": 67,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 500,
                            "main": "Rain",
                            "description": "light rain",
                            "icon": "10n"
                        }
                    ],
                    "clouds": {
                        "all": 100
                    },
                    "wind": {
                        "speed": 10.02,
                        "deg": 178,
                        "gust": 13.62
                    },
                    "visibility": 10000,
                    "pop": 0.33,
                    "rain": {
                        "3h": 0.29
                    },
                    "sys": {
                        "pod": "n"
                    },
                    "dt_txt": "2022-08-25 12:00:00"
                },
                {
                    "dt": 1661439600,
                    "main": {
                        "temp": 84.47,
                        "feels_like": 91.85,
                        "temp_min": 84.47,
                        "temp_max": 84.47,
                        "pressure": 1005,
                        "sea_level": 1005,
                        "grnd_level": 1004,
                        "humidity": 71,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 500,
                            "main": "Rain",
                            "description": "light rain",
                            "icon": "10n"
                        }
                    ],
                    "clouds": {
                        "all": 100
                    },
                    "wind": {
                        "speed": 7.4,
                        "deg": 174,
                        "gust": 13.4
                    },
                    "visibility": 10000,
                    "pop": 0.8,
                    "rain": {
                        "3h": 0.34
                    },
                    "sys": {
                        "pod": "n"
                    },
                    "dt_txt": "2022-08-25 15:00:00"
                },
                {
                    "dt": 1661450400,
                    "main": {
                        "temp": 82.54,
                        "feels_like": 89.85,
                        "temp_min": 82.54,
                        "temp_max": 82.54,
                        "pressure": 1004,
                        "sea_level": 1004,
                        "grnd_level": 1002,
                        "humidity": 79,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 500,
                            "main": "Rain",
                            "description": "light rain",
                            "icon": "10n"
                        }
                    ],
                    "clouds": {
                        "all": 100
                    },
                    "wind": {
                        "speed": 5.19,
                        "deg": 170,
                        "gust": 11.27
                    },
                    "visibility": 10000,
                    "pop": 0.73,
                    "rain": {
                        "3h": 0.99
                    },
                    "sys": {
                        "pod": "n"
                    },
                    "dt_txt": "2022-08-25 18:00:00"
                },
                {
                    "dt": 1661461200,
                    "main": {
                        "temp": 80.2,
                        "feels_like": 85.12,
                        "temp_min": 80.2,
                        "temp_max": 80.2,
                        "pressure": 1003,
                        "sea_level": 1003,
                        "grnd_level": 1002,
                        "humidity": 83,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 500,
                            "main": "Rain",
                            "description": "light rain",
                            "icon": "10n"
                        }
                    ],
                    "clouds": {
                        "all": 100
                    },
                    "wind": {
                        "speed": 6.64,
                        "deg": 279,
                        "gust": 12.8
                    },
                    "visibility": 10000,
                    "pop": 0.92,
                    "rain": {
                        "3h": 1.96
                    },
                    "sys": {
                        "pod": "n"
                    },
                    "dt_txt": "2022-08-25 21:00:00"
                },
                {
                    "dt": 1661472000,
                    "main": {
                        "temp": 79.52,
                        "feels_like": 79.52,
                        "temp_min": 79.52,
                        "temp_max": 79.52,
                        "pressure": 1005,
                        "sea_level": 1005,
                        "grnd_level": 1003,
                        "humidity": 81,
                        "temp_kf": 0
                    },
                    "weather": [
                        {
                            "id": 500,
                            "main": "Rain",
                            "description": "light rain",
                            "icon": "10d"
                        }
                    ],
                    "clouds": {
                        "all": 100
                    },
                    "wind": {
                        "speed": 4.25,
                        "deg": 308,
                        "gust": 9.28
                    },
                    "visibility": 10000,
                    "pop": 0.85,
                    "rain": {
                        "3h": 0.72
                    },
                    "sys": {
                        "pod": "d"
                    },
                    "dt_txt": "2022-08-26 00:00:00"
                }
            ],
            "city": {
                "id": 1609350,
                "name": "Bangkok",
                "coord": {
                    "lat": 13.75,
                    "lon": 100.5167
                },
                "country": "TH",
                "population": 5104476,
                "timezone": 25200,
                "sunrise": 1661036743,
                "sunset": 1661081822
            }
        }
        """.utf8Data
}
