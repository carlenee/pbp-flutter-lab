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
</details>

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
- Column : Display children dalam format vertikal

3. Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed).
- onPressed, onChanged, AnimationEvent, ClipboardEvent, ErrorEvent , dll

4.  Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.

Navigator pada Flutter menggunakan implementasi stack. Navigator menyediakan metode untuk mengubah tumpukan dengan push to stack atau dengan keluar dari tumpukan. Metode Navigator.push adalah untuk menavigasi ke halaman yang lebih baru dan Navigator.pop untuk kembali dari halaman saat ini.


5.  Explain how you implemented the checking list above.

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
    child: TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color.fromRGBO(128,212,196,1),),

                    ),
                    hintText: "Title",
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      title = value!;
                    });
                  },

                  onSaved: (String? value) {
                    setState(() {
                      title = value!;
                    });
                  },

                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Title cannot be empty!';
                    }
                    return null;
                  },

                ),
    ```
  
  -  Add an input element with int data type in the form of budget amount.

    ```
    child: TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color.fromRGBO(128,212,196,1),),

                      ),
                      hintText: "Amount",
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        amount = int.parse(value!);
                      });
                    },

                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        amount = int.parse(value!);
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Amount cannot be empty!';
                      }
                      return null;
                    },


                  ),
    ```
  -  Add a dropdown element containing the type budget with income and expense options.

  ```
  DropdownButton<String>(
                    value: jenis,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    elevation: 16,
                    hint: Text(
                      "Choose Type",
                      style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                    ),
                    underline: Container(
                      height: 2,
                      color: Colors.white,
                    ),
                    items: listJenis.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(), onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    jenis = value!;
                  });
                },
                ),

  ```

  -  Add a button to save the budget.

  ```
  TextButton(
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color.fromRGBO(128,212,196,1)),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      listForm.add(title);
                      listForm.add(amount);
                      listForm.add(jenis);
                      list.add(listForm);
                      listForm = [];
                      _sendDataToBudgetData(context);
                    }
                  },
                ),
  ```

  - Membuat function untuk mengirim data ke page Budget Data

  ```
  void _sendDataToBudgetData(BuildContext context){
    var dataToSend = list;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  BudgetDataPage(list: dataToSend,))
    );
    
  }
  ```
  
  -  Add a page of budget data

  ```
    class BudgetDataPage extends StatelessWidget {
    final list;
    BudgetDataPage({super.key, @required this.list});

    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Text('Budget Data', style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22, color: Colors.black54,
          ),),
        ),
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const AddBudgetPage()),
                  );
                },
              ),

            ],
          ),
        ),
        body: SafeArea(
          child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) => Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Color.fromRGBO(128,212,196,1)
              )
            ),
            elevation: 6,
            margin: const EdgeInsets.all(10),
            child:  ListTile(
              title: Text(list[index][0]),
              subtitle: Text(list[index][1].toString() + "\$"),
              trailing: Text(list[index][2]),
            ),
          )
            
          
        ),
        )
      );
    }


  }
  ```



</pre>
</details>

<details>
<summary> Watch List </summary>
<pre>

##  **Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?.** 

Ya bisa, kita dapat menggunakan manual serialization yaitu dengan menggunakan built-in JSON decoder dari dart:convert. Kita akan passing raw JSON String ke jsonDecode(), kemudian hasilnya akan ada pada Map<String, dynamic>. Namun membuat model akan lebih baik sebelum melakukan pengambilan data JSON, karena jika kita mengambil banyak akan lebih error-prone dan susah untuk di manage, jika JSON field typo / tidak ada maka akan error saat runtime.

##  ** Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.** 

- Material App : sebagai root dari aplikasi
- Scaffold : menyediakan struktur dasar dan styling dalam aplikasi
- Text : Display string dalam satu baris
- AppBar : display toolbar widgets, seperti title dan actions
- Padding : widget yang insets child dengan memberikan padding
- Drawer : Panel Desain Material yang meluncur secara horizontal dari tepi Scaffold  untuk menampilkan tautan navigasi dalam aplikasi.
- ListView : Display children satu persatu dalam scrolling direction
- SizedBox : Sebuah kotak dengan ukuran tertentu. Jika diberikan anak, widget ini memaksa anaknya untuk memiliki lebar dan/atau tinggi tertentu
- Container : Widget kenyamanan yang menggabungkan lukisan umum, penentuan posisi, dan widget ukuran.
- Column : Display children dalam format vertikal

##  ** Jelaskan mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.** 

1. Menambahkan dependensi http ke proyek, dependency ini digunakan untuk bertukar data melalui HTTP request, seperti GET, POST, PUT, dan lain-lain.

2. Membuat model sesuai dengan respons dari data yang berasal dari web service tersebut.

3. Membuat http request ke web service menggunakan dependency http.

4. Mengkonversikan objek yang didapatkan dari web service ke model yang telah kita buat di langkah kedua.

5. Menampilkan data yang telah dikonversi ke aplikasi dengan FutureBuilder.

##  ** Cara Implementasi.** 

1. Menambahkan drawer untuk watchlist
2. Membuat model yang sesuai untuk data json mywatchlist
3. Membuat function untuk fetch data dari mywatchlist/json
4. Menampilkan data pada widget
5. Membuat page detail untuk data

</pre>
</details>



   
