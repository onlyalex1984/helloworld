# Hello World WPF Application

A simple yet elegant Windows Presentation Foundation (WPF) application built with PowerShell. This project demonstrates how to create a modern GUI application using PowerShell and WPF.

## 🌟 Features

- **Modern UI**: Clean and professional interface built with WPF
- **Tabbed Interface**: Organized content with Main and About tabs
- **Responsive Design**: Properly sized and positioned elements
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

## 🔍 How It Works

The application uses PowerShell to create a WPF GUI. Key components include:

```powershell
# Import required WPF assemblies
Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase

# Define the UI using XAML
$xamlString = @'
<Window ...>
    <!-- UI elements defined here -->
</Window>
'@

# Load and display the UI
[xml]$xaml = $xamlString
$window = [System.Windows.Markup.XamlReader]::Load((New-Object System.Xml.XmlNodeReader $xaml))
$window.ShowDialog()
```

## 👨‍💻 Author

**onlyalex1984**

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---
