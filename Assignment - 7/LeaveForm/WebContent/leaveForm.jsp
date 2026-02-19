<!DOCTYPE html>
<html>
<head>
<title>Leave Form</title>
<link rel="stylesheet" href="style.css">
</head>
<body>

<div class="container">
<h2>Leave Application</h2>

<form action="LeaveServlet" method="post">
<label>Your Name</label>
<input type="text" name="name" required>
<label>Reason</label>
<input type="text" name="reason" required>
<label>From Date</label>
<input type="date" name="from" required>
<label>To Date</label>
<input type="date" name="to" required>

<button type="submit">Apply Leave</button>
</form>

</div>
</body>
</html>
