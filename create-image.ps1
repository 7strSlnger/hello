Add-Type -AssemblyName System.Drawing

$width = 400
$height = 300
$bitmap = New-Object System.Drawing.Bitmap($width, $height)
$graphics = [System.Drawing.Graphics]::FromImage($bitmap)

# Green to black gradient background
$brush = New-Object System.Drawing.LinearGradientBrush([System.Drawing.Point]::new(0,0), [System.Drawing.Point]::new($width,$height), [System.Drawing.Color]::Lime, [System.Drawing.Color]::Black)
$graphics.FillRectangle($brush, 0, 0, $width, $height)

# Draw 'M' for Metallica
$font = New-Object System.Drawing.Font('Arial', 120, [System.Drawing.FontStyle]::Bold)
$brush2 = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::Lime)
$graphics.DrawString('M', $font, $brush2, 130, 50)

# Draw lightning bolt pattern
$pen = New-Object System.Drawing.Pen([System.Drawing.Color]::Lime, 3)
$points = @([System.Drawing.Point]::new(300, 100), [System.Drawing.Point]::new(330, 150), [System.Drawing.Point]::new(310, 170), [System.Drawing.Point]::new(350, 250))
$graphics.DrawLines($pen, $points)

# Save as JPG
$bitmap.Save('metallica.jpg', [System.Drawing.Imaging.ImageFormat]::Jpeg)
$graphics.Dispose()
$bitmap.Dispose()
Write-Host 'JPG created successfully'
