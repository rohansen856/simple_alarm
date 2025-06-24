# Flutter Alarm Clock

Simple Alarm is a Flutter-based alarm clock application designed to provide a simple yet effective way to manage alarms. This project serves as a foundation for building more advanced alarm clock applications using Flutter.

## Features

- **Customizable Alarms**: Set, edit, and delete alarms with ease.
- **Multiple Build Configurations**: Supports Debug, Profile, and Release modes for flexible development and deployment.
- **Modern CMake Integration**: Uses modern CMake practices for streamlined builds.
- **Cross-Platform Support**: Built using Flutter, enabling compatibility with multiple platforms.

## Prerequisites

Before you begin, ensure you have the following installed:

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (version 3.14 or higher)
- [CMake](https://cmake.org/download/) (version 3.14 or higher)
- A suitable IDE such as [Android Studio](https://developer.android.com/studio) or [Visual Studio Code](https://code.visualstudio.com/)
- A device or emulator for testing (iOS or Android)

## Setup Instructions

Follow these steps to set up and run the project:

1. **Clone the Repository**:
    ```bash
    git clone https://github.com/rohansen856/simple_alarm.git
    cd simple_alarm
    ```

2. **Install Flutter Dependencies**:
    ```bash
    flutter pub get
    ```

3. **Configure the Build System**:
    Ensure CMake is installed and properly configured. The `CMakeLists.txt` file is already set up for this project.

4. **Run the Application**:
    - For Android:
      ```bash
      flutter run
      ```
    - For iOS:
      ```bash
      flutter run -d ios
      ```

5. **Build for Release**:
    - Android:
      ```bash
      flutter build apk --release
      ```
    - iOS:
      ```bash
      flutter build ios --release
      ```

## Project Structure

- **`lib/`**: Contains the Dart source code for the application.
- **`assets/`**: Stores static assets such as images and sounds.
- **`CMakeLists.txt`**: Configures the build system for the project.
- **`README.md`**: Documentation for the project.

## Build Configurations

The project supports the following build configurations:

- **Debug**: For development and debugging.
- **Profile**: For performance profiling.
- **Release**: For production deployment.

The build configuration can be set in the `CMakeLists.txt` file or via the `CMAKE_BUILD_TYPE` variable.

## Resources

- [Flutter Documentation](https://docs.flutter.dev/): Comprehensive guides, tutorials, and API references.
- [CMake Documentation](https://cmake.org/documentation/): Official documentation for CMake.
- [Dart Language Tour](https://dart.dev/guides/language): Learn the Dart programming language.

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Commit your changes and push them to your fork.
4. Submit a pull request with a detailed description of your changes.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

Special thanks to the Flutter and CMake communities for their excellent tools and documentation.

