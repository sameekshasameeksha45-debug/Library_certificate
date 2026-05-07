<?php
include $_SERVER['DOCUMENT_ROOT'].'/config.php';
require __DIR__ . '/fpdf/fpdf.php';

// =============================
// CHECK PARTICIPANT ID
// =============================
if (!isset($_GET['id'])) die("Participant ID is required.");
$id = intval($_GET['id']);
$res = $conn->query("SELECT p.*, e.event_name 
                     FROM participants p 
                     LEFT JOIN events e ON p.event_id = e.id 
                     WHERE p.id = $id");
$row = $res->fetch_assoc();
if (!$row) die("Participant not found.");

// =============================
// PARTICIPANT DETAILS
// =============================
$name         = $row['name'];
$usn          = strtoupper($row['usn']);
$event        = $row['event_name'];
$achievement  = strtolower($row['achievement']);
$contribution = !empty($row['contribution']) ? ucfirst($row['contribution']) : "Contribution";
$date         = date('d-m-Y');

// =============================
// TEMPLATE HANDLING (fixed per participant)
// =============================
$templateDir = $_SERVER['DOCUMENT_ROOT'] . "/certificates/templates/";
$templates = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg"];

// ✅ Check if participant already has a template assigned
if (empty($row['template_file'])) {
    // Choose a random template and save it in DB
    $templateFile = $templates[array_rand($templates)];
    $conn->query("UPDATE participants SET template_file = '$templateFile' WHERE id = $id");
} else {
    // Use the previously assigned template
    $templateFile = $row['template_file'];
}

$templatePath = $templateDir . $templateFile;
if (!file_exists($templatePath)) die("❌ Template not found: $templatePath");

// =============================
// OUTPUT DIRECTORY
// =============================
$outputDir = $_SERVER['DOCUMENT_ROOT'] . "/certificate/certificates";
if (!file_exists($outputDir)) mkdir($outputDir, 0777, true);
$outputPdfPath = $outputDir . "/" . str_replace(" ","_",$name) . "_certificate.pdf";

// =============================
// FETCH RANDOM CONTRIBUTION STATEMENT
// =============================
$contributionText = "Special recognition for their contribution in $contribution.";
$stmt = $conn->query("SELECT statement FROM contribution_statements ORDER BY RAND() LIMIT 1");
if ($stmt && $stmt->num_rows > 0) {
    $randomRow = $stmt->fetch_assoc();
    $contributionText = str_replace('$contribution', $contribution, $randomRow['statement']);
}

// =============================
// CREATE PDF (A4 Landscape)
// =============================
$pdf = new FPDF('L','mm','A4');
$pdf->AddPage();
$pdf->Image($templatePath,0,0,$pdf->GetPageWidth(),$pdf->GetPageHeight());
$pageWidth = $pdf->GetPageWidth();
$currentY = 70; // starting Y position

// Heading
$pdf->SetFont('Arial','B',32);
$pdf->SetTextColor(218,165,32);
$heading = ($achievement === "won prize") ? "CERTIFICATE OF APPRECIATION" : "CERTIFICATE OF PARTICIPATION";
$pdf->SetXY(0,$currentY);
$pdf->Cell($pageWidth,15,$heading,0,1,'C');
$currentY += 20;

// Presented to
$pdf->SetFont('Arial','',16);
$pdf->SetTextColor(0,0,0);
$pdf->SetXY(0,$currentY);
$pdf->Cell($pageWidth,10,"This certificate is presented to",0,1,'C');
$currentY += 15;

// Name + USN
$pdf->SetFont('Arial','B',22);
$pdf->SetTextColor(0,102,204);
$pdf->SetXY(0,$currentY);
$pdf->Cell($pageWidth,12,"$name ($usn)",0,1,'C');
$currentY += 20;

// Achievement line
$pdf->SetFont('Arial','',14);
$pdf->SetTextColor(0,0,0);
$achievementText = "who has successfully $achievement in $event on $date.";
$pdf->SetXY(10,$currentY);
$pdf->MultiCell($pageWidth-20,6,$achievementText,0,'C');
$currentY = $pdf->GetY() + 5;

// Institute line
$pdf->SetFont('Arial','',12);
$pdf->SetTextColor(128,0,128);
$pdf->SetXY(0,$currentY);
$pdf->Cell($pageWidth,6,"Organized by Department of CSE(AI&ML), GSSS Institute of Engineering and Technology for Women, Mysuru.",0,1,'C');
$currentY += 10;

// Contribution
$pdf->SetFont('Arial','I',12);
$pdf->SetTextColor(0,102,102);
$pdf->SetXY(10,$currentY);
$pdf->MultiCell($pageWidth-20,5,$contributionText,0,'C');
$currentY = $pdf->GetY() + 5;

// Closing
$pdf->SetFont('Arial','',12);
$pdf->SetTextColor(0,0,0);
$pdf->SetXY(10,$currentY);
$pdf->MultiCell($pageWidth-20,5,"Their self-approach, teamwork, and enthusiasm shown are incredible in this event.",0,'C');

$pdf->SetFont('Arial','',12);
$pdf->SetTextColor(0,0,0);
$pdf->SetY(181);
$pdf->SetX(15);


$pdf->Cell(0,8,"Verified by Department of CSE(AI&ML)",0,1,'L');

// OUTPUT PDF
$pdf->Output('F',$outputPdfPath);
$pdf->Output('I',str_replace(" ","_",$name)."_certificate.pdf");
exit;
?>
