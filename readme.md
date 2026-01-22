Cara Menjalankan Project
1.    Buka project menggunakan Xcode
2.    Pilih simulator atau device iOS
3.    Jalankan aplikasi dengan menekan Run (⌘R)

Tidak ada konfigurasi tambahan atau dependency eksternal.

API yang Digunakan

Picsum Photos API
"https://picsum.photos/v2/list?page=1&limit=10"

Architecture

MVVM + Use Case + Repository

SwiftUI View
 → ViewModel
 → Use Case
 → Repository
 → API Service

Penjelasan singkat:
-   View (SwiftUI)
Menampilkan UI dan melakukan binding ke state.
-   ViewModel
Mengelola state aplikasi dan business logic.
-   Use Case
Menjadi penghubung antara ViewModel dan Repository.
-   Repository
Abstraksi sumber data.
-   API Service
Menangani request network dan error.


Pendekatan Implementasi
-   SwiftUI
-   Async/Await
-   ViewModel menggunakan @MainActor
-   Bottom Tab Navigation (Home & Bookmark)
-   Bookmark disimpan di memory (tanpa local storage)
-   Fokus pada separation of concerns

Testing
-   Unit test dibuat untuk PhotosViewModel
-   Skenario yang diuji:
-   Load data awal
-   Pagination
-   Tambah & hapus bookmark
-   Error handling
-   Use Case dan Repository tidak pakai unit test karena hanya berfungsi sebagai delegator tanpa logic tambahan.
    
Estimasi Waktu Pengerjaan

Total waktu pengerjaan: ± 3–4 jam

Author

[Giffy Hering Akbari]
iOS Developer
