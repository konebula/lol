# Import the necessary assemblies
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create the main form
$form = New-Object System.Windows.Forms.Form
$form.Text = "System Utilities"
$form.Size = New-Object System.Drawing.Size(400, 300)
$form.StartPosition = "CenterScreen"

# Create a tab control
$tabControl = New-Object System.Windows.Forms.TabControl
$tabControl.Dock = "Fill"
$tabControl.TabPages.Clear()

# Create the pages
$killTaskPage = New-Object System.Windows.Forms.TabPage
$killTaskPage.Text = "Kill Tasks"

$cpuTempPage = New-Object System.Windows.Forms.TabPage
$cpuTempPage.Text = "CPU Temperature"

$shutdownPage = New-Object System.Windows.Forms.TabPage
$shutdownPage.Text = "Shutdown PC"

# Add the pages to the tab control
$tabControl.TabPages.Add($killTaskPage)
$tabControl.TabPages.Add($cpuTempPage)
$tabControl.TabPages.Add($shutdownPage)

# Create controls for the kill tasks page
$killTaskLabel = New-Object System.Windows.Forms.Label
$killTaskLabel.Text = "Enter task name or PID:"
$killTaskLabel.Location = New-Object System.Drawing.Point(10, 20)
$killTaskLabel.Size = New-Object System.Drawing.Size(100, 20)

$killTaskTextBox = New-Object System.Windows.Forms.TextBox
$killTaskTextBox.Location = New-Object System.Drawing.Point(10, 40)
$killTaskTextBox.Size = New-Object System.Drawing.Size(200, 20)

$killTaskButton = New-Object System.Windows.Forms.Button
$killTaskButton.Text = "Kill Task"
$killTaskButton.Location = New-Object System.Drawing.Point(10, 60)
$killTaskButton.Size = New-Object System.Drawing.Size(100, 20)
$killTaskButton.Add_Click({
    $taskName = $killTaskTextBox.Text
    Get-Process -Name $taskName -ErrorAction SilentlyContinue | Stop-Process -Force
    $killTaskTextBox.Text = ""
})

# Add controls to the kill tasks page
$killTaskPage.Controls.Add($killTaskLabel)
$killTaskPage.Controls.Add($killTaskTextBox)
$killTaskPage.Controls.Add($killTaskButton)

# Create controls for the CPU temperature page
$cpuTempLabel = New-Object System.Windows.Forms.Label
$cpuTempLabel.Text = "CPU Temperature:"
$cpuTempLabel.Location = New-Object System.Drawing.Point(10, 20)
$cpuTempLabel.Size = New-Object System.Drawing.Size(100, 20)

$cpuTempValue = New-Object System.Windows.Forms.Label
$cpuTempValue.Text = ""
$cpuTempValue.Location = New-Object System.Drawing.Point(10, 40)
$cpuTempValue.Size = New-Object System.Drawing.Size(100, 20)

# lisab kontrollid cpu temperatuuri leheküljele
$cpuTempPage.Controls.Add($cpuTempLabel)
$cpuTempPage.Controls.Add($cpuTempValue)

# teeb kontrollid shutdown leheküljele
$shutdownButton = New-Object System.Windows.Forms.Button
$shutdownButton.Text = "Shutdown PC"
$shutdownButton.Location = New-Object System.Drawing.Point(10, 20)
$shutdownButton.Size = New-Object System.Drawing.Size(100, 20)
$shutdownButton.Add_Click({
    Stop-Computer -Force
})

# lisab kontrollid shutdown leheküljel
$shutdownPage.Controls.Add($shutdownButton)

# näitab lehe vormi
$form.Controls.Add($tabControl)

# näitab vormi
$form.Add_Shown({ $form.Activate() })
$form.ShowDialog() | Out-Null

# uuendab temperatuuri iga 5 sekundi tagant
while ($form.Visible) {
    $cpuTemp = (Get-WmiObject -Class Win32_TemperatureProbe).Temperature
    $cpuTempValue.Text = "CPU Temperature: $($cpuTemp)°C"
    Start-Sleep -Milliseconds 5000
}