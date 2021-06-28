  
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8">
   <link rel="stylesheet" type="text/css" href="style.css">
   <title>Tugas 8</title>
   <style>
      table {
            border-collapse: collapse;
      }
      th, td {
            font-size: 13px; 
            border: 1px solid; 
            padding: 3px 5px; 
      }
      th {
            background: #CCCCCC;
            font-size: 12px;
      }
   </style>
</head>
<body>
   <div class="container">
      <center><h1>SMK BINAMITRA</h1></center>
      <div class="main">
         <?php
         include("koneksi.php");
         // query untuk menampilkan data
         $sql = 'SELECT * FROM guru';
         $result = mysqli_query($conn, $sql);
         ?>
         <h3>Tabel Guru</h3>
         <table>
          <tr>
            <th>NIK</th>
            <th>Nama Guru</th>
            <th>No. TLP</th>
         </tr>
            <?php if($result): ?>
            <?php while($row = mysqli_fetch_array($result)): ?>
            <tr>
               <td><?= $row['nik'];?></td>
               <td><?= $row['nama_guru'];?></td>
               <td><?= $row['no_tlp'];?></td>
            </tr>             
            <?php endwhile; else: ?>
            <tr>
            <td colspan="7">Belum ada data</td>
            </tr>
            <?php endif; ?>
         <?php
         include("koneksi.php");
         // query untuk menampilkan data
         $sql2 = 'SELECT * FROM murid';
         $result = mysqli_query($conn, $sql2);
         ?>
      </table>
         <h3>Tabel Murid</h3>
         <table>
          <tr>
            <th>Nim</th>
            <th>Nama Murid</th>
            <th>Tgl_Lahir</th>
            <th>Jenis Kelamin</th>
         </tr>
            <?php if($result): ?>
            <?php while($row = mysqli_fetch_array($result)): ?>
            <tr>
               <td><?= $row['nim'];?></td>
               <td><?= $row['nama_murid'];?></td>
               <td><?= $row['tgl_lahir'];?></td>
               <td><?= $row['jenis_kelamin'];?></td>
            </tr>             
            <?php endwhile; else: ?>
            <tr>
            <td colspan="7">Belum ada data</td>
            </tr>
            <?php endif; ?>
         </table>
         <?php
         include("koneksi.php");
         // query untuk menampilkan data
         $sql3 = 'SELECT * FROM mata_pelajaran';
         $result = mysqli_query($conn, $sql3);
         ?>
         <h3>Tabel Mata Pelajaran</h3>
         <table>
          <tr>
            <th>Kode Mata Pelajaran</th>
            <th>Nama Mata Pelajaran</th>
         </tr>
            <?php if($result): ?>
            <?php while($row = mysqli_fetch_array($result)): ?>
            <tr>
               <td><?= $row['kode_mp'];?></td>
               <td><?= $row['nama_mp'];?></td>
            </tr>             
            <?php endwhile; else: ?>
            <tr>
            <td colspan="7">Belum ada data</td>
            </tr>
            <?php endif; ?>
         </table>
         <?php
         include("koneksi.php");
         // query untuk menampilkan data
         $sql4 = 'SELECT * FROM nilai_rapot';
         $result = mysqli_query($conn, $sql4);
         ?>
         <h3>Tabel Nilai</h3>
         <table>
          <tr>
            <th>ID Rapot</th>
            <th>NIM</th>
            <th>Kode Mata Pelajaran</th>
            <th>NIK Guru</th>
            <th>Nilai</th>
         </tr>
            <?php if($result): ?>
            <?php while($row = mysqli_fetch_array($result)): ?>
            <tr>
               <td><?= $row['id_rapot'];?></td>
               <td><?= $row['nim'];?></td>
               <td><?= $row['kode_mp'];?></td>
               <td><?= $row['nik'];?></td>
               <td><?= $row['nilai'];?></td>
            </tr>             
            <?php endwhile; else: ?>
            <tr>
            <td colspan="7">Belum ada data</td>
            </tr>
            <?php endif; ?>
      </div>
   </div>
</body>
</html>