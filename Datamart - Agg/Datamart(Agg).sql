WITH CTE AS (
	SELECT 
		b.kode_barang,
        b.nama_barang,
        b.harga AS harga_per_unit,
        b.kemasan,
        b.kode_brand,
        b.brand,
        p.id_cabang,
        p.id_invoice,
        p.tanggal,
        p.id_customer,
        p.id_barang,
        p.jumlah_barang,
        p.unit,
        SUM(b.harga * p.jumlah_barang) AS total_belanja
	FROM barang_ds b
    JOIN penjualan p
		ON p.id_barang = b.kode_barang
        
	GROUP BY 
		b.kode_barang,
        b.nama_barang,
        b.harga,
        b.kemasan,
        b.kode_brand,
        b.brand,
        p.id_cabang,
        p.id_invoice,
        p.tanggal,
        p.id_customer,
        p.id_barang,
        p.jumlah_barang,
        p.unit
),
transaksiCTE AS (
	SELECT 
		p.id_customer,
        p.group AS customer_group,
        p.nama,
        p.level,
        p.cabang_sales
	FROM 
		pelanggan_ds p
)
SELECT
	tanggal AS tanggal_transaksi,
	nama AS nama_cabang,
    cabang_sales,
    level,
	customer_group,
    nama_barang,
    brand,
    harga_per_unit,
    jumlah_barang,
    kemasan,
    total_belanja
    
    
FROM transaksiCTE t
JOIN CTE
		ON CTE.id_customer = t.id_customer