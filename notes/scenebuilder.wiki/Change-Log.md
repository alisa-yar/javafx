## 16.0.0 - TBD

### Bug Fixes

### Changes

### New Features


## 15.0.1 - January 24, 2021

### Bug fixes

- [#316](https://github.com/gluonhq/scenebuilder/pull/317) - Fix Scene Builder 15 start on Windows


## 15.0.0 - January 8, 2021

### Changes

- [#157](https://github.com/gluonhq/scenebuilder/pull/227) - Move InfoPanelController to kit module 
- [#207](https://github.com/gluonhq/scenebuilder/issues/207) - Refresh the scene graph every time fxomDocument changes
- [Use JavaFX gradle plugin to build Scene Builder](https://github.com/gluonhq/scenebuilder/pull/223)
- [#205](https://github.com/gluonhq/scenebuilder/issues/205) - All SceneBuilder javadoc points to openjfx.io
- [Move SelectionBar css file](https://github.com/gluonhq/scenebuilder/pull/214)
- [Replace wildcard imports with individual class imports](https://github.com/gluonhq/scenebuilder/pull/217)
- [Replace AppBar with BottomNavigation in View template](https://github.com/gluonhq/scenebuilder/pull/212)

### New Features

- [Store Color as an object instead of its web string representation](https://github.com/gluonhq/scenebuilder/pull/209)
- [Wildcard import enable/disable option in preferences](https://github.com/gluonhq/scenebuilder/pull/210)
- [#171](https://github.com/gluonhq/scenebuilder/issues/171) - Add support to disable accordion animation
- [UserLibrary: Add folder to Library Manager](https://github.com/gluonhq/scenebuilder/pull/228)
- [Scan test resources for Controller class](https://github.com/gluonhq/scenebuilder/pull/177)

## 11.0.0 - November 26, 2018

### Bug Fixes

- [#186](https://github.com/gluonhq/scenebuilder/issues/186) - Fix i18n feature
- [#174](https://github.com/gluonhq/scenebuilder/issues/174) - Fix for DialogPane "Button Types" don't support ButtonType.OK

### Changes

- [Integration with Java 11](https://github.com/gluonhq/scenebuilder/pull/199)

### New Features

- [#172](https://github.com/gluonhq/scenebuilder/issues/172) - Add support for Stage and Scene as FXML file root

## 8.5.0 - May 28, 2018

### Bug Fixes

- [#131](https://github.com/gluonhq/scenebuilder/issues/131) - Add required imports when using GlueElements
- [#158](https://github.com/gluonhq/scenebuilder/issues/158) - NullPointerException when including FXML file
- [#159](https://github.com/gluonhq/scenebuilder/issues/159) - NullPointerException when dealing with StringListEditor, FunctionalInterfaceEditor and DurationEditor
- [JDK-8134249](https://bugs.openjdk.java.net/browse/JDK-8134249) - FXML LoadException in OSGi environments
- [#175](https://github.com/gluonhq/scenebuilder/issues/175) - Font editor not added to Inspector for custom controls

### New Features

- [#41](https://github.com/gluonhq/scenebuilder/issues/41/) - Resize lines in content panel
- Edit features for Quad, CubicCurve, Polyline and Polygon shapes
- Support for Gluon Mobile 5.0.0
- Japanese translations added