<details>
<summary> counter_7 (tugas 7) </summary>
<pre>

# counter_7

##  **Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.** 

Stateless widget adalah widget yang tidak dapat berubah contohnya Icon, IconButton, dan text. Sedangkan stateful widget adalah  widget yang sifatnya dinamis atau dapat berubah-ubah, contohnya mengubah nilai variable, warna, dll.

##  **Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya**

- Material App : sebagai root dari aplikasi
- Scaffold : menyediakan struktur dasar dan styling dalam aplikasi
- Column : Display children dalam format vertikal
- Row : Display children dalam format horizontal
- Text : Display string dalam satu baris
- AppBar : display toolbar widgets, seperti title dan actions

##  **Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.**

berfungsi untuk memberitahu framework bahwa ada object yang berubah pada State, kemudian akan melakukan build ulang pada Widget tersebut. Variabel yang akan terdampak adalah variable yang diganti pada fungsi tersebut (tergantung fungsi tersebut ingin mengubah apa)

##  **Jelaskan perbedaan antara const dengan final.**

final dapat digunakan untuk deklarasi variabel immutable yang nilainya sudah ataupun belum diketahui pada saat waktu kompilasi berjalan. Sedangkan Const dapat digunakan untuk deklarasi variabel immutable yang nilainya bersifat konstan dan harus sudah diketahui pada saat waktu kompilasi (Compile time) berjalan, artinya adalah nilai dari variabel tersebut harus sudah di berikan value secara langsung.

## **Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.**

1. Melakukan perintah ```flutter create counter_7```

2. Mengimplementasikan widget - widget yang diperlukan pada program dan melakukan styling 

3. Membuat fungsi untuk logika penambahan dan pengurangan angka.
    ``` 
    void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
    }
    void _decrementCounter() {
        setState(() {
        _counter--;
        });
    }

4. Menambahkan variabel dan fungsi berikut untuk mengubah text dan warna text ketika angka berubah
```
  String kondisi = 'GENAP';
  Color textcolor = Colors.black;

  void setOddEven(){
    setState(() {
      if(_counter % 2 == 0){
        kondisi = 'GENAP';
        textcolor = Colors.blue;
      }else{
        kondisi = 'GANJIL';
        textcolor = Colors.red;
      }
    });
  }
```

5. Bonus:
    ```
     if(_counter != 0)FloatingActionButton(
               onPressed: (){
                 _decrementCounter();
                 setOddEven();
               },
               backgroundColor: Color(0xffb2d2a4),
               tooltip: 'Increment',
               child: Icon(Icons.remove),
             ),
    ```
    Menambahkan kondisi tersebut sebelum button - agar button - hilang ketika angka 0.

</pre>
<details> 
<summary> Budget (Tugas 8) </summary>
<pre>

1. Explain the difference between Navigator.push and Navigator.pushReplacement.

Navigator.push Menambahkan Rute ke tumpukan rute yang dikelola oleh Navigator sedangkan Navigator.pushReplacement Menambahkan Rute ke tumpukan rute yang dikelola oleh Navigator Ganti rute navigator saat ini dengan mendorong rute yang diberikan dan kemudian membuang rute sebelumnya setelah rute baru selesai dianimasikan.

2. List all the widgets you used in this project and explain their functions.

- Material App : sebagai root dari aplikasi
- Scaffold : menyediakan struktur dasar dan styling dalam aplikasi
- Text : Display string dalam satu baris
- AppBar : display toolbar widgets, seperti title dan actions
- Padding : widget yang insets child dengan memberikan padding
- Drawer : Panel Desain Material yang meluncur secara horizontal dari tepi Scaffold  untuk menampilkan tautan navigasi dalam aplikasi.
- SizedBox : Sebuah kotak dengan ukuran tertentu. Jika diberikan anak, widget ini memaksa anaknya untuk memiliki lebar dan/atau tinggi tertentu
- Form : Wadah opsional untuk mengelompokkan beberapa widget bidang formulir (mis. widget TextField).
- FormField: mempertahankan status bidang formulir saat ini, sehingga pembaruan dan kesalahan validasi tercermin secara visual di UI.
- Container : Widget kenyamanan yang menggabungkan lukisan umum, penentuan posisi, dan widget ukuran.
- Icon : Material Design Icon

3.  Explain how you implemented the checking list above.

- Add a drawer/hamburger menu to the previously created app and Add three navigation buttons on the drawer/hamburger.

  ```
  // Adding drawer menu
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(height: 30.0,),
            // Adding clickable menu
            ListTile(
              title: const Text('counter_7'),
              onTap: () {
                // Routing the menu to the main page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
            ),
            ListTile(
              title: const Text('Add Budget Info'),
              onTap: () {
                // Routing the menu to the form page
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => const AddBudgetPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Budget Data'),
              onTap: () {
                // Routing the menu to the form page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) =>  BudgetDataPage(list: list)),
                );
              },
            ),
          ],
        ),
      ),
  ```
  - Add an input element with String data type in the form of budget title.
    ```
    
   
