Add-Type -AssemblyName system.windows.forms

$formobject=[System.Windows.Forms.form]
$LabelObject=[System.Windows.Forms.Label]
$comboboxobject=[System.Windows.Forms.ComboBox]

$defaultfont='Verdana,10'

##baas
$appform=new-object $formobject
$appform.ClientSize='500,300'
$appform.text='lol'
$appform.BackColor='white'
$appform.Font=$defaultfont

#ehitama
$lblservice=new-object $LabelObject
$lblservice.Text='asjad :'
$lblservice.AutoSize=$true
$lblservice.Location=New-Object System.Drawing.Point(20,20)

$ddl=New-Object $comboboxobject
$ddl.Width='300'
$ddl.Location=New-Object System.Drawing.Point(125,20)

Get-Service | ForEach-Object {$ddl.Items.Add($_.Name)}

$ddl.Text='pick a service'

$lblforname=new-object $LabelObject
$lblforname.Text='service sõbralik nimi :'
$lblforname.AutoSize=$true
$lblforname.Location=New-Object System.Drawing.Point(20,80)

$lblname=new-object $LabelObject
$lblname.Text=''
$lblname.AutoSize=$true
$lblname.Location=New-Object System.Drawing.Point(200,80)

$lblforstatus=new-object $LabelObject
$lblforstatus.Text='staatus :'
$lblforstatus.AutoSize=$true
$lblforstatus.Location=New-Object System.Drawing.Point(20,120)

$lblstatus=new-object $LabelObject
$lblstatus.Text=''
$lblstatus.AutoSize=$true
$lblstatus.Location=New-Object System.Drawing.Point(200,120)

$appform.Controls.AddRange(@($lblservice,$ddl,$lblforname,$lblname,$lblforstatus,$lblstatus))

#funktsioonid

function GetServiceDetails{
         $ServiceName=$ddl.SelectedItem
         $details=Get-Service -name $ServiceName | select *
         $lblname.Text=$details.name
         $lblstatus.Text=$details.status

         if($lblstatus.Text -eq 'Running'){
               $lblstatus.ForeColor='green'
         }else{
        $lblstatus.ForeColor='red'
        }
}

$ddl.add_SelectedIndexChanged({GetServiceDetails})

$appform.ShowDialog()

##garbage koguja
$appform.Dispose()