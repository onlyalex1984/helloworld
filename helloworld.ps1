<#
.SYNOPSIS
    HelloWorld! - A simple WPF demonstration application with parameter support

.DESCRIPTION
    A PowerShell script that creates a basic Windows Presentation Foundation (WPF) GUI
    to demonstrate Hello World. Features a tabbed interface with main view and about information.
    Supports parameters for testing purposes.

.PARAMETER TestParameter1
    A test parameter that will be displayed in the UI when specified.

.PARAMETER TestParameter2
    Another test parameter that will be displayed in the UI when specified.

.NOTES
    File Name      : helloworld.ps1
    Version        : 1.0
    Author         : onlyalex1984
    Created        : Februari 2025
    Last Modified  : March 2025
    Prerequisite   : PowerShell 5.1 or higher
    GitHub         : https://github.com/onlyalex1984/helloworld
#>

param (
    [switch]$TestParameter1,
    [switch]$TestParameter2
)

# Version configuration
$script:AppVersion = "1.0"

# Determine parameter message
$parameterMessage = ""
if ($TestParameter1) {
    $parameterMessage = "Param: TestParameter1"
    Write-Host $parameterMessage
}
elseif ($TestParameter2) {
    $parameterMessage = "Param: TestParameter2"
    Write-Host $parameterMessage
}
else {
    $parameterMessage = "No parameters"
    Write-Host $parameterMessage
}

# Import assemblies
Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase

# Define WPF interface
$xamlString = @'
<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    Title="Hello World!" Height="400" Width="400" WindowStartupLocation="CenterScreen" ResizeMode="CanMinimize">
    <Grid Margin="12">
        <TabControl>
            <!-- Main Tab -->
            <TabItem Header="Main">
                <Grid>
                    <Grid.RowDefinitions>
                        <RowDefinition Height="*"/>
                        <RowDefinition Height="Auto"/>
                    </Grid.RowDefinitions>
                    
                    <StackPanel Grid.Row="0" VerticalAlignment="Center">
                        <TextBlock Text="Hello, World!" FontSize="24" Margin="10" FontWeight="Bold" 
                                  TextAlignment="Center" HorizontalAlignment="Center" />
                        <Button x:Name="CloseButton" Content="Close" Width="100" HorizontalAlignment="Center" 
                                Background="#0078D7" Foreground="White" Padding="5,3" Margin="0,15,0,0" />
                    </StackPanel>
                    
                    <TextBlock Grid.Row="1" x:Name="ParameterText" Text="No parameters" FontSize="12" 
                              Margin="10,0,10,10" TextAlignment="Center" Foreground="Gray" />
                </Grid>
            </TabItem>
            
            <!-- About Tab -->
            <TabItem Header="About" Background="#E6F2FF">
                <Grid Margin="10">
                    <Grid.RowDefinitions>
                        <RowDefinition Height="Auto"/>
                        <RowDefinition Height="Auto"/>
                        <RowDefinition Height="*"/>
                        <RowDefinition Height="Auto"/>
                    </Grid.RowDefinitions>
                    
                    <TextBlock x:Name="AboutTitle" Grid.Row="0" Text="About Hello World!" FontSize="18" FontWeight="Bold" Margin="0,0,0,15" Foreground="#0078D7"/>
                    
                    <Border Grid.Row="1" Background="#F8F8F8" BorderBrush="#CCCCCC" BorderThickness="1" Padding="15" Margin="0,0,0,15">
                        <StackPanel>
                            <TextBlock TextWrapping="Wrap" Margin="0,0,0,15">
                                This is a simple Hello World application to demonstrate Windows WPF (Windows Presentation Foundation) capabilities.
                            </TextBlock>
                            <TextBlock TextWrapping="Wrap" Margin="0,0,0,5">
                                Supported parameters:
                            </TextBlock>
                            <StackPanel Margin="10,0,0,0">
                                <TextBlock TextWrapping="Wrap" Margin="0,2,0,2">- TestParameter1 - Displays parameter info in UI</TextBlock>
                                <TextBlock TextWrapping="Wrap" Margin="0,2,0,2">- TestParameter2 - Displays parameter info in UI</TextBlock>
                            </StackPanel>
                        </StackPanel>
                    </Border>
                    
                    <!-- Author and Version Section -->
                    <Border Grid.Row="3" Background="#F0F8FF" BorderBrush="#CCCCCC" BorderThickness="1" Padding="8" Margin="0,8,0,0">
                        <Grid>
                            <Grid.ColumnDefinitions>
                                <ColumnDefinition Width="*"/>
                                <ColumnDefinition Width="Auto"/>
                            </Grid.ColumnDefinitions>
                            
                            <StackPanel Grid.Column="0">
                                <StackPanel Orientation="Horizontal" Margin="0,0,0,5">
                                    <TextBlock Text="Author: " FontWeight="SemiBold"/>
                                    <TextBlock Text="onlyalex1984"/>
                                </StackPanel>
                                
                                <StackPanel Orientation="Horizontal">
                                    <TextBlock Text="Version: " FontWeight="SemiBold"/>
                                    <TextBlock x:Name="AboutVersionText" Text="1.0"/>
                                </StackPanel>
                            </StackPanel>
                            
                            <Button x:Name="GitHubButton" Grid.Column="1" Content="Project on GitHub" Width="150"
                                    Background="#0078D7" Foreground="White" Padding="5,3" VerticalAlignment="Center"/>
                        </Grid>
                    </Border>
                </Grid>
            </TabItem>
        </TabControl>
    </Grid>
</Window>
'@

try {
    # Load XAML
    [xml]$xaml = $xamlString
    $reader = [System.Xml.XmlNodeReader]::new($xaml)
    $window = [System.Windows.Markup.XamlReader]::Load($reader)
    
    $parameterText = $window.FindName("ParameterText")
    $aboutVersionText = $window.FindName("AboutVersionText")
    $closeButton = $window.FindName("CloseButton")
    $gitHubButton = $window.FindName("GitHubButton")
    
    # Set version and parameter text
    $aboutVersionText.Text = $script:AppVersion
    $parameterText.Text = $parameterMessage
    
    $closeButton.Add_Click({
        $window.Close()
    })
    
    $gitHubButton.Add_Click({
        Start-Process "https://github.com/onlyalex1984/helloworld"
    })
    
    # Add Loaded event handler to bring window to front
    $window.Add_Loaded({
        # Set window as topmost to bring it to the front
        $window.Topmost = $true
        # Request focus
        $window.Activate()
        # Revert topmost setting to allow normal behavior
        $window.Topmost = $false
    })
    
    $window.ShowDialog() | Out-Null
}
catch {
    # Error handling
    [System.Windows.MessageBox]::Show("Error loading application: $_", "Error", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Error)
    Write-Error "Error in HelloWorld script: $_"
}
