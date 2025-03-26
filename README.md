# books

A new Flutter project.

Praktikum 1: Mengunduh Data dari Web Service (API)

## Getting Started

## *Soal 1*
Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda.
## *jawaban soal 1*
![Screenshoot books](images/titlejejen.png)
![Screenshoot books](images/soal2.png)
## *Jawaban soal 2*
![Screenshoot books](images/jawabansoal2.png)
## *Soal 3*
Jelaskan maksud kode langkah 5 tersebut terkait substring dan catchError!
Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W5: Soal 3".

Jawaban soal3
substring adalah metode dalam Dart yang digunakan untuk mengambil sebagian dari string berdasarkan indeks yang kita tentukan. Fungsi ini memotong bagian string sesuai dengan parameter yang diberikan.

catchError adalah metode yang digunakan untuk menangani error atau pengecualian dalam alur eksekusi asinkron di Dart, khususnya dalam operasi yang melibatkan Future. Jika ada kesalahan saat menjalankan kode dalam Future, kita dapat menangani error tersebut dengan catchError.
![Screenshoot books](images/jawabansoal3.png)


## **Praktikum 2: Menggunakan await/async untuk menghindari callbacks**

## *Soal 4*
*Jelaskan maksud kode langkah 1 dan 2 tersebut!*

*langkah 1*

![Screenshoot books](images/jawabansoal4langkah1.png)

1. returnOneAsync()

    - Fungsi ini mengembalikan Future<int>. Artinya, fungsi ini mengembalikan nilai integer di masa depan 
      (setelah proses asynchronous selesai).

    - await Future.delayed(const Duration(seconds: 3)) digunakan untuk menunda eksekusi selama 3 detik 
      (simulasi delay, bisa digunakan untuk menunggu data dari API, operasi I/O, dll.).

    - Setelah 3 detik, fungsi ini akan mengembalikan nilai 1.

2. returnTwoAsync()

      Fungsi ini mirip dengan returnOneAsync(), hanya saja setelah menunggu selama 3 detik, ia akan mengembalikan nilai 2.

  3. returnThreeAsync()

     Fungsi ini juga memiliki struktur yang sama dengan dua fungsi sebelumnya, tetapi ia mengembalikan nilai 3 setelah menunggu selama 3 detik.


*langkah 2*

![Screenshoot books](images/jawabansoal4langkah2.png)

*Penjelasan:*

1. Deklarasi Fungsi Asynchronous (Future count() async)

   - Future count() async: Fungsi ini dideklarasikan sebagai asynchronous dengan kata kunci async, yang berarti 
     fungsi ini akan mengembalikan Future dan memungkinkan penggunaan await di dalamnya.

   - Fungsi ini tidak mengembalikan nilai (void), tetapi mengembalikan Future yang menunjukkan bahwa fungsi ini 
  bersifat asynchronous.

2. Deklarasi dan Inisialisasi Variabel total

   - total adalah variabel bertipe integer yang digunakan untuk menyimpan hasil penjumlahan dari tiga nilai 
     yang diambil dari fungsi asynchronous.

   - total diinisialisasi dengan nilai awal 0.

3. Menunggu dan Mendapatkan Nilai dari returnOneAsync()

   - await returnOneAsync() akan menjalankan fungsi returnOneAsync() yang mengembalikan nilai 1 setelah 
     menunggu 3 detik.

   - Karena await digunakan, eksekusi kode akan menunggu sampai fungsi returnOneAsync() selesai dan 
     mengembalikan nilai, kemudian hasilnya (1) disimpan di dalam variabel total.

4. Menambah Nilai dari returnTwoAsync() ke total

   - await returnTwoAsync() akan menunggu hasil dari fungsi returnTwoAsync(), yang mengembalikan nilai 2 
     setelah menunggu 3 detik.

   - Setelah itu, nilai total akan ditambah dengan 2. Sehingga, jika sebelumnya total bernilai 1, setelah   
     operasi ini, total akan menjadi 3 (1 + 2).

5. Menambah Nilai dari returnThreeAsync() ke total

   - await returnThreeAsync() akan menunggu hasil dari fungsi returnThreeAsync(), yang mengembalikan nilai 3 
     setelah menunggu 3 detik.

   - Setelah itu, nilai total akan ditambah dengan 3. Jika sebelumnya total bernilai 3, maka setelah operasi 
     ini, total akan menjadi 6 (3 + 3).

6. Memperbarui UI dengan setState

   - setState() digunakan untuk memberitahu framework Flutter bahwa status dari widget telah berubah dan UI 
     perlu diperbarui.

   - Di dalam setState(), nilai total diubah menjadi string (total.toString()) dan disimpan dalam variabel 
     result.

   - Kemudian, nilai result ini akan digunakan untuk memperbarui tampilan UI (misalnya di Text(result) atau 
     widget lain yang menampilkan hasil).


*Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W5: Soal 4"*

![Screenshoot books](images/jawabansoal4.png)

## Praktikum 3: Menggunakan Completer di Future

Soal 5
Jelaskan maksud kode langkah 2 tersebut!

![Screenshoot books](images/p3soal5L2.png)

1. late Completer completer;

    - Completer adalah sebuah objek yang digunakan untuk mengontrol Future secara manual. Dengan Completer, 
      kita bisa mengubah status Future menjadi selesai (complete) pada saat yang kita tentukan.

    - late digunakan di sini untuk menunjukkan bahwa completer akan diinisialisasi nanti. late menandakan bahwa 
      variabel tersebut akan diberi nilai pada titik tertentu sebelum digunakan. Tanpa late, kamu harus menginisialisasi variabel pada deklarasi.

    - Tipe generik Completer<int> berarti bahwa completer akan mengelola Future<int> yang akan selesai dengan 
      sebuah nilai bertipe int.

2.  Future getNumber()

    - Fungsi getNumber() mengembalikan Future yang akan berakhir dengan nilai integer (Future<int>).
        - completer = Completer<int>(); — Membuat sebuah objek Completer<int>. Ini berarti kita siap untuk    
          mengelola sebuah Future<int>.
          
        - calculate(); — Memanggil fungsi calculate(), yang merupakan operasi asinkron yang akan menunda 
          eksekusi selama 5 detik dan kemudian menyelesaikan Completer dengan nilai 42.

        - return completer.future; — Mengembalikan future yang dihasilkan oleh completer. Future ini akan 
          berisi hasil yang diberikan oleh completer.complete(42) setelah 5 detik.

3. Future calculate()

    - Fungsi calculate() adalah operasi asinkron yang menunda eksekusi selama 5 detik menggunakan 
      Future.delayed().

    - completer.complete(42); — Setelah 5 detik, kita menyelesaikan completer dengan nilai 42. Ini mengubah 
      status Future yang dikendalikan oleh completer menjadi selesai (completed) dan memberikan hasilnya sebagai 42.

    Sistem kerja kode tersebut ialah

    1. Ketika fungsi getNumber() dipanggil, kita membuat sebuah objek Completer<int>.
    2. Fungsi calculate() dipanggil untuk menunda eksekusi selama 5 detik.
    3. Setelah 5 detik, completer.complete(42) dipanggil untuk memberikan nilai 42 pada Future yang 
       dikendalikan oleh completer.
    4. getNumber() mengembalikan future yang terkait dengan completer. Pada titik ini, future masih belum 
       selesai dan menunggu sampai completer.complete() dipanggil setelah 5 detik.
    5. Ketika completer.complete(42) dipanggil, future menjadi selesai dan berisi nilai 42.

Dengan menggunakan Completer, kita mendapatkan kontrol penuh atas kapan Future dianggap selesai dan memberikan hasilnya. Ini berguna dalam kasus-kasus di mana kamu membutuhkan lebih banyak kontrol atas operasi asinkron, misalnya ketika mengintegrasikan logika eksternal atau perhitungan yang memakan waktu.

Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W5: Soal 5".

![Screenshoot books](images/jawabansoal5.png)

Soal 6
Jelaskan maksud perbedaan kode langkah 2 dengan langkah 5-6 tersebut!
Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W5: Soal 6".

![Screenshoot books](images/jawabansoal6.png)

