ALTER VIEW vw_Satis_Raporu AS

select 
[ UrunID ],
[ Urun_Adi ],
[ Adet ] ,
[ Birim_Maliyet],
cast([ Satis_Fiyati]as int)*cast([ Adet ] as int) as Toplam_Ciro,
cast([ Satis_Fiyati]as int)*cast([ Adet ] as int) - cast([ Adet ] as int)*cast([ Birim_Maliyet] as int)as Net_Kar
from Satislar s
inner join Urunler u
on s.[ UrunID ] = u.[UrunID ]
