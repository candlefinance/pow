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
  color: string;
  style: ViewStyle;
};

const ComponentName = 'PowView';

export const PowView =
  UIManager.getViewManagerConfig(ComponentName) != null
    ? requireNativeComponent<PowProps>(ComponentName)
    : () => {
        throw new Error(LINKING_ERROR);
      };
