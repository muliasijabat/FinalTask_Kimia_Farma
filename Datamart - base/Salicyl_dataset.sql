WITH CTE AS (
	SELECT 
		b.kode_barang,
        b.nama_barang,
        b.harga,
        b.kemasan,
        b.kode_brand,
        b.brand,
        id_cabang,
        id_invoice,
        tanggal,
        id_customer,
        id_barang,
        jumlah_barang,
        unit
	FROM barang_ds b
    JOIN penjualan p
		ON p.id_barang = b.kode_barang
),
transaksiCTE AS (
	SELECT 
		p.id_customer,
        p.group AS customer_group,
        p.nama,
        p.level        
	FROM 
		pelanggan_ds p
)

SELECT
	tanggal AS tanggal_transaksi,
	nama AS nama_cabang,
    level,
	customer_group,
    nama_barang,
    brand,
    harga,
    kemasan,
    jumlah_barang
FROM transaksiCTE t
JOIN CTE
		ON CTE.id_customer = t.id_customer
