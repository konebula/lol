Add-Type -AssemblyName System.Windows.Forms

$formobject = [System.Windows.Forms.Form]
$LabelObject = [System.Windows.Forms.Label]
$buttonobject= [System.Windows.Forms.Button]

$Helloworldform=New-Object $formobject
$Helloworldform.ClientSize= '500,300'
$Helloworldform.Text='Hello World'
$Helloworldform.BackColor='#ffffff'

$lbltitle=New-Object $LabelObject
$lbltitle.Text='hello world!'
$lbltitle.AutoSize=$true
$lbltitle.Font='Verdana,24,style=bold'
$lbltitle.Location=New-Object System.Drawing.Point(120,110)

$btnhello=New-Object $buttonobject
$btnhello.Text='say hello'
$btnhello.AutoSize=$true
$btnhello.Font='Verdana,14'
$btnhello.ForeColor='red'
$btnhello.Location=New-Object System.Drawing.Point(190,160)

$Helloworldform.controls.AddRange(@($lbltitle,$btnhello))

##loogika

function SayHello{
         if($lbltitle.text -eq ''){
         $lbltitle.Text='Hello world!'
         }else{
         $lbltitle.Text=''
         }

}


## functions
$btnhello.add_click({SayHello})

#näitab formi
$Helloworldform.ShowDialog()

##puhastab formi
$Helloworldform.Dispose()
