import {
  requireNativeComponent,
  UIManager,
  Platform,
  ViewStyle,
} from 'react-native';

const LINKING_ERROR =
  `The package '@candlefinance/pow' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

type PowProps = {
  size: { width: number; height: number };
  value: string;
  onPress: (event: { nativeEvent: { value: number } }) => void;
  noSound?: boolean;
  animationType: 'rise' | 'spray';
  style: ViewStyle;
};

const ComponentName = 'PowView';

export const PowView =
  UIManager.getViewManagerConfig(ComponentName) != null
    ? requireNativeComponent<PowProps>(ComponentName)
    : () => {
        throw new Error(LINKING_ERROR);
      };
