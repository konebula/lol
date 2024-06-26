# Impordi vajalikud kogumid
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName System.ServiceProcess

# Loo põhivorm
$vorm = New-Object System.Windows.Forms.Form
$vorm.Text = "toolbox v mdgi???"
$vorm.Size = New-Object System.Drawing.Size(700, 600)  
$vorm.StartPosition = "CenterScreen"
$vorm.BackColor = [System.Drawing.Color]::WhiteSmoke

# Loo sakikontroll
$sakkJuhtimine = New-Object System.Windows.Forms.TabControl
$sakkJuhtimine.Dock = "Fill"
$sakkJuhtimine.TabPages.Clear()

# Loo sakid
$lülitaLeht = New-Object System.Windows.Forms.TabPage
$lülitaLeht.Text = "Väljalülitamine"
$lülitaLeht.BackColor = "#B57EDC"

$appiAllalaadimineLeht = New-Object System.Windows.Forms.TabPage
$appiAllalaadimineLeht.Text = "Rakenduste allalaadimine"
$appiAllalaadimineLeht.BackColor = "#BAE1D3"

$taskKillerLeht = New-Object System.Windows.Forms.TabPage
$taskKillerLeht.Text = "Task Killer"
$taskKillerLeht.BackColor = "#FF5733"

$teenusteLeht = New-Object System.Windows.Forms.TabPage
$teenusteLeht.Text = "Teenused"
$teenusteLeht.BackColor = "#728FCE"

$cliLeht = New-Object System.Windows.Forms.TabPage
$cliLeht.Text = "CLI"
$cliLeht.BackColor = "#9E1B32"

# Lisa lehed sakile
$sakkJuhtimine.TabPages.Add($lülitaLeht)
$sakkJuhtimine.TabPages.Add($appiAllalaadimineLeht)
$sakkJuhtimine.TabPages.Add($taskKillerLeht)
$sakkJuhtimine.TabPages.Add($teenusteLeht)
$sakkJuhtimine.TabPages.Add($cliLeht)

# Loo juhtelemendid Task Killer lehele
$taskKillerSilt = New-Object System.Windows.Forms.Label
$taskKillerSilt.Text = "Sisestage taski nimi või PID:"
$taskKillerSilt.Location = New-Object System.Drawing.Point(10, 20)
$taskKillerSilt.Size = New-Object System.Drawing.Size(150, 20)

$taskKillerTekstiKast = New-Object System.Windows.Forms.TextBox
$taskKillerTekstiKast.Location = New-Object System.Drawing.Point(10, 40)
$taskKillerTekstiKast.Size = New-Object System.Drawing.Size(200, 20)

$taskKillerNupp = New-Object System.Windows.Forms.Button
$taskKillerNupp.Text = "Task Killer"
$taskKillerNupp.Location = New-Object System.Drawing.Point(10, 70)
$taskKillerNupp.Size = New-Object System.Drawing.Size(100, 30)
$taskKillerNupp.BackColor = [System.Drawing.Color]::LightGray

# Loo juhtelemendid Task Killer lehele
$taskKillerLeht.Controls.Add($taskKillerSilt)
$taskKillerLeht.Controls.Add($taskKillerTekstiKast)
$taskKillerLeht.Controls.Add($taskKillerNupp)

# Loo juhtelemendid teenuste lehele
$teenusteSilt = New-Object System.Windows.Forms.Label
$teenusteSilt.Text = "Valige teenus:"
$teenusteSilt.Location = New-Object System.Drawing.Point(10, 20)
$teenusteSilt.Size = New-Object System.Drawing.Size(200, 20)

$teenusteComboBox = New-Object System.Windows.Forms.ComboBox
$teenusteComboBox.Location = New-Object System.Drawing.Point(10, 50)
$teenusteComboBox.Size = New-Object System.Drawing.Size(200, 20)

# Hangi teenuste nimekiri
$teenused = Get-Service | Select-Object -ExpandProperty Name
$teenusteComboBox.Items.AddRange($teenused)

$staatuseSilt = New-Object System.Windows.Forms.Label
$staatuseSilt.Text = "Staatus:"
$staatuseSilt.Location = New-Object System.Drawing.Point(10, 80)
$staatuseSilt.Size = New-Object System.Drawing.Size(100, 20)

$staatuseVäärtuseSilt = New-Object System.Windows.Forms.Label
$staatuseVäärtuseSilt.Location = New-Object System.Drawing.Point(120, 80)
$staatuseVäärtuseSilt.Size = New-Object System.Drawing.Size(100, 20)

# Loo juhtelemendid teenuste lehele
$teenusteLeht.Controls.Add($teenusteSilt)
$teenusteLeht.Controls.Add($teenusteComboBox)
$teenusteLeht.Controls.Add($staatuseSilt)
$teenusteLeht.Controls.Add($staatuseVäärtuseSilt)

# Lisa sündmusekäsitleja teenuse valiku jaoks
$teenusteComboBox.Add_SelectedIndexChanged({
    $valitudTeenus = $teenusteComboBox.SelectedItem
    $teenuseStaatus = (Get-Service -Name $valitudTeenus).Status
    $staatuseVäärtuseSilt.Text = $teenuseStaatus
})

# Loo juhtelemendid rakenduste allalaadimise lehele
$rakendusteSilt = New-Object System.Windows.Forms.Label
$rakendusteSilt.Text = "Vali rakendus, mida alla laadida:"
$rakendusteSilt.Location = New-Object System.Drawing.Point(10, 20)
$rakendusteSilt.Size = New-Object System.Drawing.Size(200, 20)

$spotifyKastike = New-Object System.Windows.Forms.CheckBox
$spotifyKastike.Text = "Spotify"
$spotifyKastike.Location = New-Object System.Drawing.Point(10, 50)
$spotifyKastike.Size = New-Object System.Drawing.Size(150, 20)

$checkboxDiscord = New-Object System.Windows.Forms.CheckBox
$checkboxDiscord.Text = "Discord"
$checkboxDiscord.Location = New-Object System.Drawing.Point(10, 80)
$checkboxDiscord.Size = New-Object System.Drawing.Size(150, 20)

$checkboxSteam = New-Object System.Windows.Forms.CheckBox
$checkboxSteam.Text = "Steam"
$checkboxSteam.Location = New-Object System.Drawing.Point(10, 110)
$checkboxSteam.Size = New-Object System.Drawing.Size(150, 20)

$checkboxChrome = New-Object System.Windows.Forms.CheckBox
$checkboxChrome.Text = "Chrome"
$checkboxChrome.Location = New-Object System.Drawing.Point(10, 140)
$checkboxChrome.Size = New-Object System.Drawing.Size(150, 20)

$checkboxTeamspeak = New-Object System.Windows.Forms.CheckBox
$checkboxTeamspeak.Text = "TeamSpeak"
$checkboxTeamspeak.Location = New-Object System.Drawing.Point(10, 170)
$checkboxTeamspeak.Size = New-Object System.Drawing.Size(150, 20)

$downloadButton = New-Object System.Windows.Forms.Button
$downloadButton.Text = "Tõmba valitud"
$downloadButton.Location = New-Object System.Drawing.Point(10, 200)
$downloadButton.Size = New-Object System.Drawing.Size(150, 30)
$downloadButton.BackColor = [System.Drawing.Color]::LightGray
$downloadButton.Add_Click({
    if ($checkboxSpotify.Checked) {
        Start-Process -FilePath "https://download.scdn.co/SpotifySetup.exe"
    }
    if ($checkboxDiscord.Checked) {
        Start-Process -FilePath "https://discord.com/api/download?platform=win"
    }
    if ($checkboxSteam.Checked) {
        Start-Process -FilePath "https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe"
    }
    if ($checkboxChrome.Checked) {
        Start-Process -FilePath "https://dl.google.com/chrome/install/latest/chrome_installer.exe"
    }
    if ($checkboxTeamspeak.Checked) {
        Start-Process -FilePath "https://files.teamspeak-services.com/releases/client/3.5.6/TeamSpeak3-Client-win64-3.5.6.exe"
    }
    [System.Windows.Forms.MessageBox]::Show("valitud rakendused tõmmatakse.", "Download", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
})

# Lisa juhtelemendid rakenduste allalaadimise lehele
$appiAllalaadimineLeht.Controls.Add($rakendusteSilt)
$appiAllalaadimineLeht.Controls.Add($spotifyKastike)
$appiAllalaadimineLeht.Controls.Add($checkboxDiscord)
$appiAllalaadimineLeht.Controls.Add($checkboxSteam)
$appiAllalaadimineLeht.Controls.Add($checkboxChrome)
$appiAllalaadimineLeht.Controls.Add($checkboxTeamspeak)
$appiAllalaadimineLeht.Controls.Add($downloadButton)

# Loo juhtelemendid väljalülitamise valikute lehele
$lülitaSilt = New-Object System.Windows.Forms.Label
$lülitaSilt.Text = "Vali lol:"
$lülitaSilt.Location = New-Object System.Drawing.Point(10, 20)
$lülitaSilt.Size = New-Object System.Drawing.Size(200, 20)

$lülitaNupp = New-Object System.Windows.Forms.Button
$lülitaNupp.Text = "Väljalülitamine"
$lülitaNupp.Location = New-Object System.Drawing.Point(10, 50)
$lülitaNupp.Size = New-Object System.Drawing.Size(100, 30)
$lülitaNupp.BackColor = [System.Drawing.Color]::LightGray
$lülitaNupp.Add_Click({
    if ([System.Windows.Forms.MessageBox]::Show("Olete kindel, et soovite arvuti välja lülitada?", "Küsimus", [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Question) -eq [System.Windows.Forms.DialogResult]::Yes) {
        Stop-Computer -Force
    }
})

$taaskäivitaNupp = New-Object System.Windows.Forms.Button
$taaskäivitaNupp.Text = "Taaskäivitus"
$taaskäivitaNupp.Location = New-Object System.Drawing.Point(10, 90)
$taaskäivitaNupp.Size = New-Object System.Drawing.Size(100, 30)
$taaskäivitaNupp.BackColor = [System.Drawing.Color]::LightGray
$taaskäivitaNupp.Add_Click({
    if ([System.Windows.Forms.MessageBox]::Show("Olete kindel, et soovite arvuti välja lülitada?", "Küsimus", [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Question) -eq [System.Windows.Forms.DialogResult]::Yes) {
        Stop-Computer -Force
    }
})

$logiVäljaNupp = New-Object System.Windows.Forms.Button
$logiVäljaNupp.Text = "Logi välja"
$logiVäljaNupp.Location = New-Object System.Drawing.Point(10, 130)
$logiVäljaNupp.Size = New-Object System.Drawing.Size(100, 30)
$logiVäljaNupp.BackColor = [System.Drawing.Color]::LightGray
$logiväljaNupp.Add_Click({
    if ([System.Windows.Forms.MessageBox]::Show("Olete kindel, et soovite arvuti välja lülitada?", "Küsimus", [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Question) -eq [System.Windows.Forms.DialogResult]::Yes) {
        Stop-Computer -Force
    }
})

$tühjendaPrügiNupp = New-Object System.Windows.Forms.Button
$tühjendaPrügiNupp.Text = "Tühjenda prügikast"
$tühjendaPrügiNupp.Location = New-Object System.Drawing.Point(10, 170)
$tühjendaPrügiNupp.Size = New-Object System.Drawing.Size(150, 30)
$tühjendaPrügiNupp.BackColor = [System.Drawing.Color]::LightGray
$tühjendaPrügiNupp.Add_Click({
    if ([System.Windows.Forms.MessageBox]::Show("Olete kindel, et soovite arvuti välja lülitada?", "Küsimus", [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Question) -eq [System.Windows.Forms.DialogResult]::Yes) {
        Stop-Computer -Force
    }
})

$magaNupp = New-Object System.Windows.Forms.Button
$magaNupp.Text = "Maga"
$magaNupp.Location = New-Object System.Drawing.Point(10, 210)
$magaNupp.Size = New-Object System.Drawing.Size(100, 30)
$magaNupp.BackColor = [System.Drawing.Color]::LightGray
$magaNupp.Add_Click({
    if ([System.Windows.Forms.MessageBox]::Show("Olete kindel, et soovite arvuti välja lülitada?", "Küsimus", [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Question) -eq [System.Windows.Forms.DialogResult]::Yes) {
        Stop-Computer -Force
    }
})

$taimestaNupp = New-Object System.Windows.Forms.Button
$taimestaNupp.Text = "Taimesta"
$taimestaNupp.Location = New-Object System.Drawing.Point(10, 250)
$taimestaNupp.Size = New-Object System.Drawing.Size(100, 30)
$taimestaNupp.BackColor = [System.Drawing.Color]::LightGray
$taimestaNupp.Add_Click({
    if ([System.Windows.Forms.MessageBox]::Show("Olete kindel, et soovite arvuti välja lülitada?", "Küsimus", [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Question) -eq [System.Windows.Forms.DialogResult]::Yes) {
        Stop-Computer -Force
    }
})

$lukustaNupp = New-Object System.Windows.Forms.Button
$lukustaNupp.Text = "Lukusta"
$lukustaNupp.Location = New-Object System.Drawing.Point(10, 290)
$lukustaNupp.Size = New-Object System.Drawing.Size(100, 30)
$lukustaNupp.BackColor = [System.Drawing.Color]::LightGray
$lukustaNupp.Add_Click({
    if ([System.Windows.Forms.MessageBox]::Show("Olete kindel, et soovite arvuti välja lülitada?", "Küsimus", [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Question) -eq [System.Windows.Forms.DialogResult]::Yes) {
        Stop-Computer -Force
    }
})

$tahvelarvutiUuendusedNupp = New-Object System.Windows.Forms.Button
$tahvelarvutiUuendusedNupp.Text = "Kontrolli uuendusi"
$tahvelarvutiUuendusedNupp.Location = New-Object System.Drawing.Point(10, 330)
$tahvelarvutiUuendusedNupp.Size = New-Object System.Drawing.Size(150, 30)
$tahvelarvutiUuendusedNupp.BackColor = [System.Drawing.Color]::LightGray
$tahvelarvutiUuendusedNupp.Add_Click({
    if ([System.Windows.Forms.MessageBox]::Show("Olete kindel, et soovite arvuti välja lülitada?", "Küsimus", [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Question) -eq [System.Windows.Forms.DialogResult]::Yes) {
        Stop-Computer -Force
    }
})
$hibernateButton = New-Object System.Windows.Forms.Button
$hibernateButton.Text = "Hibernate"
$hibernateButton.Location = New-Object System.Drawing.Point(10, 370)
$hibernateButton.Size = New-Object System.Drawing.Size(100, 30)
$hibernateButton.BackColor = [System.Drawing.Color]::LightGray
$hibernateButton.Add_Click({
    Add-Type -AssemblyName System.Windows.Forms
    [System.Windows.Forms.Application]::SetSuspendState([System.Windows.Forms.PowerState]::Hibernate, $false, $true)
})


# Lisa juhtelemendid väljalülitamise valikute leheküljele
$lülitaLeht.Controls.Add($lülitaSilt)
$lülitaLeht.Controls.Add($lülitaNupp)
$lülitaLeht.Controls.Add($lukustaNupp)
$lülitaLeht.Controls.Add($tahvelarvutiUuendusedNupp)
$lülitaLeht.Controls.Add($magaNupp)
$lülitaLeht.Controls.Add($tühjendaPrügiNupp)
$lülitaLeht.Controls.Add($logiVäljaNupp)
$lülitaLeht.Controls.Add($taaskäivitaNupp)
$lülitaLeht.Controls.Add($taimestaNupp)
$lülitaLeht.Controls.Add($hibernateButton)

# Lisa sakikontroll vormile
$vorm.Controls.Add($sakkJuhtimine)

# Loo tekstikast, kuhu väljund kuvatakse
$väljundiKast = New-Object System.Windows.Forms.TextBox
$väljundiKast.Multiline = $true
$väljundiKast.ReadOnly = $true
$väljundiKast.ScrollBars = [System.Windows.Forms.ScrollBars]::Vertical
$väljundiKast.Size = New-Object System.Drawing.Size(580, 400)
$väljundiKast.Location = New-Object System.Drawing.Point(10, 10)
$cliLeht.Controls.Add($väljundiKast)

# Loo tekstikast, kuhu sisend sisestatakse
$sisendiKast = New-Object System.Windows.Forms.TextBox
$sisendiKast.Size = New-Object System.Drawing.Size(580, 20)
$sisendiKast.Location = New-Object System.Drawing.Point(10, 420)
$cliLeht.Controls.Add($sisendiKast)

# Funktsioon, mis võimaldab käskude täitmist
function Execute-Command {
    param (
        [string]$käsk
    )
    # Kontrollib, kas käsk pole tühi
    if (-not [string]::IsNullOrEmpty($käsk)) {
        # Käsk käivitub
        $väljund = Invoke-Expression $käsk 2>&1

        # Uuendab väljundit
        $väljundiKast.AppendText("$väljund`n")
        $väljundiKast.ScrollToCaret()

        # Tühjendab sisendi kasti pärast Enteri vajutamist
        $sisendiKast.Text = ''
    }
}

# Tekstisisestuskasti lisamine käsul, mis käivitub Enteri vajutamisel
$sisendiKast.Add_KeyDown({
    param (
        [System.Object]$saatja,
        [System.Windows.Forms.KeyEventArgs]$e
    )

    if ($e.KeyCode -eq [System.Windows.Forms.Keys]::Enter) {
        Execute-Command -käsk $sisendiKast.Text
        $e.SuppressKeyPress = $true
    }
})

# Loo nupp käsu sisestamiseks
$käsuNupp = New-Object System.Windows.Forms.Button
$käsuNupp.Text = "Sisesta käsk"
$käsuNupp.Location = New-Object System.Drawing.Point(10, 450)
$käsuNupp.Size = New-Object System.Drawing.Size(100, 30)
$käsuNupp.BackColor = [System.Drawing.Color]::LightGray
$käsuNupp.Add_Click({
    Execute-Command -käsk $sisendiKast.Text
    $sisendiKast.Text = ''
})
$cliLeht.Controls.Add($käsuNupp)

# Näitab vormi
$vorm.Add_Shown({ $vorm.Activate() })
$vorm.ShowDialog() | Out-Null