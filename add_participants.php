<?php
session_start();
include_once __DIR__ . "/../config.php";

$usn = $_SESSION['usn'] ?? 'Unknown';

$message = "";
$message_type = "";

/* -------------------- ADD PARTICIPANT -------------------- */
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['add_participant'])) {

    $name         = trim($_POST['name'] ?? '');
    $event_id     = intval($_POST['event_id'] ?? 0);
    $event_date   = $_POST['event_date'] ?? '';
    $contribution = trim($_POST['contribution'] ?? '');
    $achievement  = $_POST['achievement'] ?? 'Participated';

    if ($name && $event_id > 0 && $contribution && $event_date) {

        // Case-sensitive duplicate check
        $check = $conn->prepare("
            SELECT id FROM participants 
            WHERE BINARY name = ? 
            AND event_id = ? 
            AND BINARY contribution = ?
            AND usn = ?
        ");

        $check->bind_param("siss", $name, $event_id, $contribution, $usn);
        $check->execute();
        $check->store_result();

        if ($check->num_rows > 0) {

            
            $message_type = "danger";

        } else {

            $stmt = $conn->prepare("INSERT INTO participants 
                (usn, name, event_id, contribution, status, event_date, achievement)
                VALUES (?, ?, ?, ?, 'Submitted', ?, ?)");

            $stmt->bind_param("ssisss", 
                $usn, 
                $name, 
                $event_id, 
                $contribution,
                $event_date, 
                $achievement
            );

            if ($stmt->execute()) {
                $message = "✅ Participant added successfully!";
                $message_type = "success";
            } else {
                $message = "⚠️ Error: " . $stmt->error;
                $message_type = "danger";
            }

            $stmt->close();
        }

        $check->close();

    } else {
        $message = "⚠️ Please fill all required fields.";
        $message_type = "danger";
    }
}


/* -------------------- DELETE PARTICIPANT -------------------- */
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['delete_participant'])) {

    $id = intval($_POST['delete_id']);

    $stmt = $conn->prepare("DELETE FROM participants WHERE id=? AND usn=?");
    $stmt->bind_param("is", $id, $usn);

    if ($stmt->execute()) {
        $message = "🗑️ Participant deleted successfully!";
        $message_type = "success";
    } else {
        $message = "⚠️ Delete failed.";
        $message_type = "danger";
    }

    $stmt->close();
}

/* -------------------- FETCH EVENTS -------------------- */
$events = $conn->query("SELECT id, event_name FROM events ORDER BY event_name ASC");

/* -------------------- FETCH PARTICIPANTS -------------------- */
$stmtList = $conn->prepare("
    SELECT p.*, e.event_name 
    FROM participants p
    LEFT JOIN events e ON p.event_id = e.id
    WHERE p.usn=?
    ORDER BY p.id DESC
");
$stmtList->bind_param("s", $usn);
$stmtList->execute();
$participants = $stmtList->get_result();
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>My Participants</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link href="common-styles.css" rel="stylesheet">
</head>

<body>

<div class="container-fluid py-4">

<?php if(!empty($message)): ?>
<div class="alert alert-<?= htmlspecialchars($message_type) ?> fade-away d-flex align-items-center justify-content-between" role="alert">
    <span><?= htmlspecialchars($message) ?></span>
    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
</div>
<?php endif; ?>

<div class="row g-4">

<!-- ADD PARTICIPANT FORM -->
<div class="col-12">
<div class="card card-sweet p-4">
<h5 class="mb-3">
<i class="bi bi-person-plus"></i> Add Participant
</h5>

<form method="POST">
<div class="row g-3">

<div class="col-md-4">
<label class="form-label">Name *</label>
<input type="text" name="name" class="form-control" required>
</div>

<div class="col-md-4">
<label class="form-label">Event *</label>
<select name="event_id" class="form-control" required>
<option value="">Select</option>
<?php while($row = $events->fetch_assoc()): ?>
<option value="<?= $row['id'] ?>">
<?= htmlspecialchars($row['event_name']) ?>
</option>
<?php endwhile; ?>
</select>
</div>

<div class="col-md-4">
<label class="form-label">Event Date *</label>
<input type="date" name="event_date" class="form-control" required>
</div>

<div class="col-md-6">
<label class="form-label">Contribution *</label>
<input type="text" name="contribution" class="form-control" required>
</div>

<div class="col-md-6">
<label class="form-label">Achievement</label>
<select name="achievement" class="form-control">
<option value="Participated">Participated</option>
<option value="Won Prize">Won Prize</option>
<option value="Coordinator">Coordinator</option>
</select>
</div>

</div>

<div class="d-flex gap-3 mt-4">

<button type="submit" name="add_participant"
class="btn btn-gradient btn-add flex-fill">
<i class="bi bi-plus-circle"></i> Add Participant
</button>

<a href="feedback_form.php"
class="btn btn-outline-primary flex-fill">
<i class="bi bi-chat-left-text"></i> Go to Feedback
</a>

</div>

</form>
</div>
</div>

<!-- PARTICIPANT TABLE -->
<div class="col-12">
<div class="card card-sweet p-4">
<h5 class="mb-3">
<i class="bi bi-list"></i> My Participants
</h5>

<?php if($participants->num_rows == 0): ?>
<p class="text-muted">No participants added yet.</p>
<?php else: ?>

<div class="table-responsive">
<table class="table table-bordered table-hover align-middle text-center">
<thead class="table-light">
<tr>
<th>Name</th>
<th>Event</th>
<th>Date</th>
<th>Contribution</th>
<th>Achievement</th>
<th>Status</th>
<th>Action</th>
<th>

</tr>
</thead>
<tbody>
<?php while($row = $participants->fetch_assoc()): ?>
<tr>
<td><?= htmlspecialchars($row['name']) ?></td>
<td><?= htmlspecialchars($row['event_name']) ?></td>
<td><?= htmlspecialchars($row['event_date']) ?></td>
<td><?= htmlspecialchars($row['contribution']) ?></td>
<td><?= htmlspecialchars($row['achievement']) ?></td>

<td>
<?php if($row['status'] === 'Approved'): ?>
    <a href="certificate.php?id=<?= $row['id'] ?>" 
       class="btn btn-primary btn-sm">
       View
    </a>
<?php else: ?>
    <span class="badge bg-info">
        <?= htmlspecialchars($row['status']) ?>
    </span>
<?php endif; ?>
</td>

<td>
<form method="POST">
<input type="hidden" name="delete_id" value="<?= $row['id'] ?>">
<button type="submit" name="delete_participant"
class="btn btn-sm btn-danger"
onclick="return confirm('Delete this participant?');">
<i class="bi bi-trash"></i>
</button>
</form>
</td>

</tr>
<?php endwhile; ?>
</tbody>
</table>
</div>

<?php endif; ?>

</div>
</div>

</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
