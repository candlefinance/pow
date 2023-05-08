[![Twitter URL](https://img.shields.io/twitter/url/https/twitter.com/candlefinance.svg?style=social&label=Follow%20%40candlefinance)](https://twitter.com/candlefinance) [![npm version](https://badge.fury.io/js/%40candlefinance%2Fpow.svg)](https://badge.fury.io/js/%40candlefinance%2Fpow)[![npm downloads](https://img.shields.io/npm/dm/%40candlefinance%2Fpow.svg)](https://npm.im/%40candlefinance%2Fpow)

A bridge for the [Pow's](https://movingparts.io/pow) SwiftUI library to React Native. There are two animations available, check out the video below to see them in action.

[![Watch the video](https://user-images.githubusercontent.com/12258850/236861875-228fecbb-2b09-4629-b47d-1e5dc23b8738.png)](https://user-images.githubusercontent.com/12258850/236861212-55ffb63e-93db-4c91-93f6-8f8dbd5ac5b6.mp4)

## Installation

```sh
yarn add @candlefinance/pow
```

## Usage

```js
<PowView
  animationType="spray"
  size={{ width: 220, height: 40 }}
  value={`${value}`}
  isSoundOn={true}
  style={styles.box}
/>
```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
