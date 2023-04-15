Wrapper for the [pow](https://movingparts.io/pow) library.

## Installation

```sh
npm install @candlefinance/pow
```

## Usage

```js
<PowView
  onPress={(event) => {
    console.log('press JS', event.nativeEvent.value);
  }}
  size={{ width: 150, height: 40 }}
  value={value}
  noSound={false}
  style={styles.box}
/>
```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
