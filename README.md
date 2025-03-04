# Hello World WPF Application

A simple yet elegant Windows Presentation Foundation (WPF) application built with PowerShell. This project demonstrates how to create a modern GUI application using PowerShell and WPF.

## 🌟 Features

- **Modern UI**: Clean and professional interface built with WPF
- **Tabbed Interface**: Organized content with Main and About tabs
- **Responsive Design**: Properly sized and positioned elements
- **Parameter Support**: Command-line parameters for testing purposes
- **About Section**: Information about the application and author
- **GitHub Integration**: Direct link to the project repository

## 📋 Requirements

- Windows 7 or newer
- PowerShell 5.1 or higher
- .NET Framework 4.5 or higher

## 🚀 Installation

1. Clone this repository:
   ```powershell
   git clone https://github.com/onlyalex1984/helloworld.git
   ```

2. Navigate to the project directory:
   ```powershell
   cd helloworld
   ```

3. Run the application:
   ```powershell
   powershell -File helloworld.ps1
   ```

## 💻 Usage

Simply run the PowerShell script to launch the application. The interface includes:

- **Main Tab**: Displays the classic "Hello, World!" message with a close button
- **About Tab**: Provides information about the application, including:
  - Brief description
  - Author information
  - Version details
  - Link to the GitHub project

### Command-line Parameters

The application supports the following parameters for testing purposes:

```powershell
# Run with TestParameter1
.\helloworld.ps1 -TestParameter1

# Run with TestParameter2
.\helloworld.ps1 -TestParameter2
```

When a parameter is specified, the application will display the parameter name in the UI.

## 🔍 How It Works

The application uses PowerShell to create a WPF GUI with the following key components:

1. **Parameter Handling**: Processes command-line parameters and displays them in the UI
2. **WPF Framework**: Uses the Windows Presentation Foundation for the graphical interface
3. **XAML-Based UI**: Defines the interface using XAML markup
4. **Event Handling**: Manages button clicks and window events

The script imports necessary WPF assemblies, processes any parameters, loads the XAML interface, and displays the window to the user.

## 👨‍💻 Author

**onlyalex1984**

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---
