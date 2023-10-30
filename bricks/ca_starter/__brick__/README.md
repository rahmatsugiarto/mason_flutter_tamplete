# Starter App

isi dengan keterangan aplikasi

## How to Run

<!-- Project ini menggunakan [Flutter 3.13.4](https://flutter.dev/) -->

Clone project ini dan jalankan perintah dibawah di path project terminal.

```bash
flutter pub run build_runner build --delete-conflicting-outputs
flutter pub get
flutter run
```


## Branch

- Master/main -> branch untuk code terbaru/production
- dev -> branch untuk development
- release -> branch yang dibuat setiap kali app release ke playstrore dan appstore. Berguna jika kita ingin melihat code di berbagai version yang sudah release.


## Folder Structure

```bash
lib/
    core/
        ...
    data/
        ...
    domain/
        ...
    presentation/
        ...
    firebase_options.dart
    injection_container.dart
    main.dart
    router.dart
```

### core

Berisikan file/class yang umum dipakai diclass lain.

### data

Berisikan tentang datasource, data model dan repository implement.

### domain

Berisikan tentang data entities yang mau ditampilkan ke UI, abstrack repository dan usecase.

### presentation

Berisikan file terkait UI, class widget dan state management yang dipakai yaitu bloc(cubit)

## Authors

- [@rahmatsugiarto](https://git.digitalevent.id/rahmatsugiarto)
