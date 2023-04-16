import * as React from 'react';

import { Pressable, StyleSheet, Text, View } from 'react-native';
import { PowView } from '@candlefinance/pow';

export default function App() {
  const [value, setValue] = React.useState(1000);

  return (
    <View style={styles.container}>
      <PowView
        animationType="spray"
        isSoundOn={true}
        size={{ width: 220, height: 40 }}
        value={`${value}`}
        style={styles.box}
      />

      <Pressable
        onPress={() => {
          setValue(value * -1);
          console.log('press', value);
        }}
      >
        <Text>press</Text>
      </Pressable>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 220,
    height: 40,
    borderRadius: 20,
    backgroundColor: '#d3d3d3',
  },
});
