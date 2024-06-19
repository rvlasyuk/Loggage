# Loggage
![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)
![Build status](https://travis-ci.org/ThomasCle/Loggage.svg?branch=master)
![Swift version](https://img.shields.io/badge/Swift-5.0-F16D39.svg?style=flat)

Light weight logger framework, that allows you to control levels of log messages. The framework is highly customizable and contains simple features to improve the visibility of your log messages, such as flashing the screen when an error occurs.

## Installation

Using Swift Package Manager is recommended.

### Carthage
`github "ThomasCle/Loggage" ~> 1.3.0`

## Usage
```
Loggage.verbose("")
Loggage.debug("")
Loggage.info("")
Loggage.warning("")
Loggage.error("")
```

To avoid writing import in all files you can create an alias in your `AppDelegate`.

```
import Loggage
public typealias Log = Loggage
```

Note that the `Loggage` class will be named `Log` with this alias, so you would be calling this framework through `Log` instead: `Log.info("Info message")`

### Custom tracking
Loggage allows you to hook into it via an `ILoggageEventHandler` instance. By settings the `eventHandler` property your instance can be invoked every time Loggage performs a log message. This way you can post the log message to Firebase, Fabric Answers, etc.

## Release

You probably don't want the console printing to be active when building a Release. To disable the `print` commands of Loggage you can set the `printingEnabled` property to `false`. It is **recommended** to do so when releasing.

## Contribution
1. Fork
2. Branch from either `development` (new features 🆕) or `master` (hot fixes 🔥)
3. Develop and write unit tests.
4. Commit with great messages.
5. Push when you are done.
6. Create a pull request.
7. Wait for Travis CI to make sure everything builds! 👷🏻

If you need more guidance, then [read this](https://akrabat.com/the-beginners-guide-to-contributing-to-a-github-project/).

Happy contributing! 🎉

## License
[MIT License](https://github.com/ThomasCle/Loggage/blob/master/LICENSE)
