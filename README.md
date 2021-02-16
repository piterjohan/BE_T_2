# Project Test BE
Guide:

### Step 1
After Clone This Project
```
composer install
```

### Step 2
Open .env search DB_Database fill what ever your database
```
DB_DATABASE=laravel_inventory
```

### Step 3
Because i cant use migrate for creating View on Mysql so open directory 
- Database
- export-Xampp
  - u can import that data to phpmyadmin

## API List
- **Get**
    - v1/min-stock-distributor
- **POST**
    - v1/min-stock-distributor param(idBarang,barangKeluar)
    - v1/add-stock-supplier param(idBarang, barangMasuk)
    - v1/avg-products param(idProduct)
    - v1/monthly-report param(tanggal)

>Here the [Sketch Database](https://dbdiagram.io/d/602b453980d742080a3aa5e8) 

>**Thank You**


